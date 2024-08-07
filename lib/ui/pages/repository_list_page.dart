import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/item_bloc.dart';
import '../../bloc/item_event.dart';
import '../../bloc/item_state.dart';
import '../../data/local/database_helper.dart';
import '../../data/remote/github_api_service.dart';
import '../widgets/repository_item_widget.dart';

class RepositoryListPage extends StatelessWidget {
  final ItemBloc itemBloc = ItemBloc(GithubApiService(), DatabaseHelper());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => itemBloc..add(FetchItems(DateTime.now().toIso8601String())),
      child: Scaffold(
        appBar: AppBar(
          title: Text('GitHub Repositories'),
        ),
        body: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is ItemLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ItemLoaded) {
              print('state=${state.items.length}');
              return RefreshIndicator(
                onRefresh: () async {
                  itemBloc.add(RefreshItems(DateTime.now().toIso8601String()));
                },
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return RepositoryItemWidget(item: item);
                  },
                ),
              );
            } else if (state is ItemError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No items'));
            }
          },
        ),
      ),
    );
  }
}
