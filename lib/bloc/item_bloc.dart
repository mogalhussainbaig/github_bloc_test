
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_bloc_task/data/local/database_helper.dart';
import 'package:github_bloc_task/data/remote/github_api_service.dart';
import 'package:http/http.dart';
import 'package:github_bloc_task/model/item_element/item_element.dart';
import 'package:github_bloc_task/utils/common_functions.dart';
import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final GithubApiService apiService;
  final DatabaseHelper dbHelper;

  ItemBloc(this.apiService, this.dbHelper) : super(ItemInitial()) {
    on<FetchItems>(_onFetchItems);
    on<RefreshItems>(_onRefreshItems);
  }

  Future<void> _onFetchItems(FetchItems event, Emitter<ItemState> emit) async {
    emit(ItemInitial());
    emit(ItemLoading());
    List<ItemElement> itemList = [];
    try {
      final localData = await dbHelper.getAllStrings();
      if (localData.isEmpty) {
        Response? response = await apiService.fetchRepositories(event.date);
        if (response != null && response.statusCode == 200) {
          await dbHelper.insertString(response.body);

          //used compute function as the isolate for response data manipulation
          itemList = await compute(parseItems, response.body);
        }
      } else {
        print('storage');
        //used compute function as the isolate for response data manipulation
        itemList =
            await compute(parseItems, localData[0]['my_string'].toString());
      }
      emit(ItemLoaded(itemList));
    } catch (e) {
      emit(ItemError('Failed to load items'));
    }
  }

  Future<void> _onRefreshItems(
      RefreshItems event, Emitter<ItemState> emit) async {
    emit(ItemInitial());
    emit(ItemLoading());
    List<ItemElement> items = [];

    try {
      Response? response = await apiService.fetchRepositories(event.date);
      if (response != null && response.statusCode == 200) {
        //used compute function as the isolate for response data manipulation
        items = parseItems(response.body);

        await dbHelper.insertString(response.body).then((value) =>
            displaySnackBarMessage(message: 'Data Updated Successfully'));
        emit(ItemLoaded(items));
      } else {
        emit(ItemError('${response?.body}'));
      }
      print('items=${items.length}');
    } catch (e) {
      emit(ItemError('Failed to refresh items'));
    }
  }
}
