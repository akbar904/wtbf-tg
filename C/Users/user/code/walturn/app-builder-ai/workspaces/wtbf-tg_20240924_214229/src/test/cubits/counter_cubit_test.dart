
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {}

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is CounterState(counterValue: 0)', () {
			expect(counterCubit.state, CounterState(counterValue: 0));
		});

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(counterValue: 1)] when increment is called',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [CounterState(counterValue: 1)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(counterValue: 10)] when multiplyByTen is called',
			build: () => counterCubit,
			act: (cubit) => cubit.multiplyByTen(),
			expect: () => [CounterState(counterValue: 10)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(counterValue: 1), CounterState(counterValue: 10)] when increment and multiplyByTen are called',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.multiplyByTen();
			},
			expect: () => [
				CounterState(counterValue: 1),
				CounterState(counterValue: 10),
			],
		);
	});
}
