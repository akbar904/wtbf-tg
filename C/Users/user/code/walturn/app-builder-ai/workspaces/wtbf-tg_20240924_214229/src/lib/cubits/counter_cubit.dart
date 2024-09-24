
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {
	final int counterValue;

	CounterState({required this.counterValue});
}

class CounterCubit extends Cubit<CounterState> {
	CounterCubit() : super(CounterState(counterValue: 0));

	void increment() {
		emit(CounterState(counterValue: state.counterValue + 1));
	}

	void multiplyByTen() {
		emit(CounterState(counterValue: state.counterValue * 10));
	}
}
