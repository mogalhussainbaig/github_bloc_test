import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/item_bloc.dart';
import '../../bloc/item_event.dart';
import '../../bloc/item_state.dart';
import '../../data/local/database_helper.dart';
import '../../data/remote/github_api_service.dart';
import '../widgets/repository_item_widget.dart';

class RepositoryListPage extends StatefulWidget {

  @override
  State<RepositoryListPage> createState() => _RepositoryListPageState();
}

class _RepositoryListPageState extends State<RepositoryListPage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData(){
    context.read<ItemBloc>().add(FetchItems(DateTime.now().toIso8601String()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Bloc Data',style: TextStyle(fontSize: 18,color: Colors.white),),
        leading: InkWell(
            onTap: (){
              SystemNavigator.pop();
            },
            child: const Icon(Icons.arrow_back,size: 25,color: Colors.white,)),
      ),
      body: RefreshIndicator(
        onRefresh: () async{

          context.read<ItemBloc>().add(RefreshItems(DateTime.now().toString()));
        },
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is ItemLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ItemLoaded) {
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return RepositoryItemWidget(item: item);
                },
              );
            } else if (state is ItemError) {
              return Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),),
              ));
            } else {
              return const Center(child: Text('No items'));
            }
          },
        ),
      ),
    );
  }
}
