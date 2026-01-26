// ✅ GOOD: BLoC only in presentation layer
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// State
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterValue extends CounterState {
  final int value;
  CounterValue(this.value);
}

// Cubit in presentation layer - this is fine
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() {
    final current = state;
    if (current is CounterValue) {
      emit(CounterValue(current.value + 1));
    } else {
      emit(CounterValue(1));
    }
  }
}

// Widget using BLoC
class GoodCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          final value = state is CounterValue ? state.value : 0;
          return Text('$value');
        },
      ),
    );
  }
}
