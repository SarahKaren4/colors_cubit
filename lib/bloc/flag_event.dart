part of 'flag_bloc.dart';

abstract class FlagEvent extends Equatable {
  const FlagEvent();

  @override
  List<Object> get props => [];
}

class LoadFlagEvent extends FlagEvent{}

class FlagPressEvent extends FlagEvent{}

class FlagResetEvent extends FlagEvent{}

class FlagRemoveEvent extends FlagEvent{}