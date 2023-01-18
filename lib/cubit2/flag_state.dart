import 'package:colors_cubit/cubit2/flag_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FlagState extends Equatable {
  const FlagState();
}

class FlagInitial extends FlagState {
  @override
  List<Object> get props => [];
}

class FlagLoaded extends FlagState {
  final List couleurHaut;
  final List <Color> couleurBas;
  final bool statusCouleurBas;
  final int count;
  const FlagLoaded(this.couleurHaut, this.couleurBas, this.count, this.statusCouleurBas);

  @override
  List<Object> get props => [couleurHaut, couleurBas, count];
}
/*
class FlagChanged extends FlagState {
  final List couleurHaut;
  final Color couleurBas;

  final int count;
  const FlagChanged(this.couleurHaut, this.couleurBas, this.count);

  @override
  List<Object> get props => [couleurHaut, couleurBas, count];
}
*/