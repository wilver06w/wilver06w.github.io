import 'dart:async';

import 'package:bloc/bloc.dart' as bloc;
import 'package:cv_send/utils/http/http_client.dart';
import 'package:cv_send/utils/preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc({
    required this.httpClient,
    required this.prefs,
  }) : super(const InitialState(Model())) {
    on<InitEvent>(_onLoadEvent);
  }

  final XigoHttpClient httpClient;
  final Preferences prefs;

  Future<void> _onLoadEvent(
    InitEvent event,
    Emitter<State> emit,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 8));
      emit(LoadedState(state.model));
    } catch (e) {
      emit(ErrorState(state.model));
    }
  }
}
