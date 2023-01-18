import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:colors_cubit/flag_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'flag_event.dart';
part 'flag_state.dart';

class FlagBloc extends Bloc<FlagEvent, FlagState> {
  FlagBloc() : super(FlagInitial()) {
    on<LoadFlagEvent>((event, emit) {
      emit(FlagLoaded(flag: Flag.defaultFlag, count: 0));
    });

    on<FlagPressEvent>((event, emit) {
      var rng = Random();
      var i = rng.nextInt(Flag.flagList.length);
      var flag = Flag.flagList[i];

      final state = this.state as FlagLoaded;
      emit(FlagLoaded(flag: state.count > 0 ? state.flag : flag,
          count: state.count < 3 ? state.count + 1: state.count));
    });

    on<FlagResetEvent>((event, emit) {
      emit(FlagLoaded(flag: Flag.defaultFlag, count: 0));
    });

    on<FlagRemoveEvent>((event, emit) {

      final state = this.state as FlagLoaded;
      emit(FlagLoaded(flag: state.flag,
          count: state.count > 0 ? state.count - 1 : state.count));
    });
  }
}
