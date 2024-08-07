import 'package:equatable/equatable.dart';

abstract class ItemEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchItems extends ItemEvent {
  final String date;

  FetchItems(this.date);

  @override
  List<Object?> get props => [date];
}

class RefreshItems extends ItemEvent {
  final String date;

  RefreshItems(this.date);

  @override
  List<Object?> get props => [date];
}
