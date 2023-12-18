import 'package:bloc/bloc.dart';
import 'package:cv_send/_childrens/home/_childrens/info/models/item_project.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class DetailProjectBloc extends Bloc<DetailProjectEvent, DetailProjectState> {
  DetailProjectBloc() : super(const InitialState(Model())) {
    on<ChangedItemProjectEvent>(_onChangedItemProjectEvent);
  }

  void _onChangedItemProjectEvent(
    ChangedItemProjectEvent event,
    Emitter<DetailProjectState> emit,
  ) {
    emit(
      ChangedItemProjectState(
        state.model.copyWith(
          itemProject: event.itemProject,
        ),
      ),
    );
  }
}
