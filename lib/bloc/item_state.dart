import 'package:equatable/equatable.dart';
import 'package:github_bloc_task/model/item_element/item_element.dart';

abstract class ItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<ItemElement> items;

  ItemLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class ItemError extends ItemState {
  final String message;

  ItemError(this.message);

  @override
  List<Object?> get props => [message];
}
