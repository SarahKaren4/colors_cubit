import 'dart:math';
import 'dart:ui';

import 'package:colors_cubit/cubit2/flag_model.dart';
import 'package:colors_cubit/cubit2/flag_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlagCubit extends Cubit<FlagState> {
  FlagCubit() : super(FlagInitial()) {
    LoadFlag();
  }

  void LoadFlag() {
    print("Loaded");

    emit(FlagLoaded(Flag.couleursHaut, Flag.couleursBas, 0, true));
  }

  void FlagPress(Color couleurDuBas, int indexcouleur) {
    var rng = Random();
    var i = rng.nextInt(Flag.flagList.length);
    var flag = Flag.flagList[i];

    final state = this.state as FlagLoaded;
    emit(
        FlagLoaded(Flag.couleursHaut, Flag.couleursBas, state.count + 1, true));
    print("Pressed" + couleurDuBas.toString());

    //  emit(FlagLoaded(flag: state.count > 0 ? state.flag : flag,
    //  count: state.count < 3 ? state.count + 1: state.count));

    //emit()
  }

  void FlagReset() {
    //  emit(FlagLoaded(flag: Flag.defaultFlag, count: 0));
  }

  void FlagRemove() {
    final state = this.state as FlagLoaded;

    ///  emit(FlagLoaded(flag: state.flag,
    // count: state.count > 0 ? state.count - 1 : state.count));
  }
}
