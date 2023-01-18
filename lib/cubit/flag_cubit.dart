import 'dart:async';
import 'dart:math';

import 'package:colors_cubit/bloc/flag_bloc.dart';
import 'package:colors_cubit/flag_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FlagCubit extends Cubit<FlagState> {
  FlagCubit() : super(FlagInitial()) {
    LoadFlag();
  }

void LoadFlag() {
  emit(FlagLoaded(flag: Flag.defaultFlag, count: 0));

}

void FlagPress() {
    var rng = Random();
    var i = rng.nextInt(Flag.flagList.length);
    var flag = Flag.flagList[i];

    final state = this.state as FlagLoaded;
    emit(FlagLoaded(flag: state.count > 0 ? state.flag : flag,
    count: state.count < 3 ? state.count + 1: state.count));

    }

    void FlagReset() {
    emit(FlagLoaded(flag: Flag.defaultFlag, count: 0));
    }


   void FlagRemove() {
    final state = this.state as FlagLoaded;
    emit(FlagLoaded(flag: state.flag,
    count: state.count > 0 ? state.count - 1 : state.count));

    }
  }

