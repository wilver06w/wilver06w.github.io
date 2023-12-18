part of 'bloc.dart';

abstract class InfoEvent extends Equatable {
  const InfoEvent();

  @override
  List<Object> get props => [];
}

class ChangedOptionSelectedEvent extends InfoEvent {
  final int optionSelected;

  const ChangedOptionSelectedEvent({
    required this.optionSelected,
  });
}

class GetExperiencesEvent extends InfoEvent {}
class GetProjectsEvent extends InfoEvent {}
