part of 'couter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CouterLoaded extends CounterState {
  final int currentValue;
  final int currentValueOfPlus2;

  CouterLoaded(this.currentValue, this.currentValueOfPlus2);
}
