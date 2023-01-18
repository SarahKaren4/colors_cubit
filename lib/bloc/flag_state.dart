part of 'flag_bloc.dart';

abstract class FlagState extends Equatable {
  const FlagState();
}

class FlagInitial extends FlagState {
  @override
  List<Object> get props => [];
}

class FlagLoaded extends FlagState {
  final Flag flag;
  final int count;
  const FlagLoaded({required this.flag, required this.count});

  @override
  List<Object> get props => [flag, count];
}
