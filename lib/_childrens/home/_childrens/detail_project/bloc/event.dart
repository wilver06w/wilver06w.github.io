part of 'bloc.dart';

abstract class DetailProjectEvent extends Equatable {
  const DetailProjectEvent();

  @override
  List<Object> get props => [];
}

class ChangedItemProjectEvent extends DetailProjectEvent {
  final ItemProject itemProject;

  const ChangedItemProjectEvent({
    required this.itemProject,
  });
}
