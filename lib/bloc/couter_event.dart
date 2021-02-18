part of 'couter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class ResetCounterEvent extends CounterEvent {}
