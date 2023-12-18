part of 'bloc.dart';

abstract class DetailProjectState extends Equatable {
  final Model model;
  const DetailProjectState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends DetailProjectState {
  const InitialState(Model model) : super(model);
}

class ChangedItemProjectState extends DetailProjectState {
  const ChangedItemProjectState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.itemProject = const ItemProject(
      title: '',
      subtitle: '',
      about: '',
      technologies: [],
      urlSite: '',
    ),
  });

  final ItemProject itemProject;

  Model copyWith({
    ItemProject? itemProject,
  }) {
    return Model(
      itemProject: itemProject ?? this.itemProject,
    );
  }

  @override
  List<Object?> get props {
    return [
      itemProject,
    ];
  }
}
