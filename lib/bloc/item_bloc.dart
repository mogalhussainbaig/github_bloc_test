import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/local/database_helper.dart';
import '../data/remote/github_api_service.dart';
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
    emit(ItemLoading());

    try {
      // final items = await dbHelper.getItems();
      final items = await apiService.fetchRepositories(event.date);

      emit(ItemLoaded(items));
    } catch (e) {
      emit(ItemError('Failed to load items'));
    }
  }

  Future<void> _onRefreshItems(RefreshItems event, Emitter<ItemState> emit) async {
    emit(ItemLoading());

    try {
      final items = await apiService.fetchRepositories(event.date);
      print('items=${items.length}');
      // await dbHelper.insertItems(items);
      emit(ItemLoaded(items));
    } catch (e) {
      emit(ItemError('Failed to refresh items'));
    }
  }
}
