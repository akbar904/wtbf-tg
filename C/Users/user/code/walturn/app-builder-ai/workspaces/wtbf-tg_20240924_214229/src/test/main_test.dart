
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/main.dart';

class MockCounterCubit extends Mock implements CounterCubit {}

void main() {
	group('Main App Initialization', () {
		testWidgets('renders CounterScreen on start', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(CounterScreen), findsOneWidget);
		});
	});

	group('CounterCubit Cubit Tests', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		blocTest<CounterCubit, CounterState>(
			'emits CounterState with incremented value when increment is called',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [CounterState(counterValue: 1)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits CounterState with multiplied value when multiplyByTen is called',
			build: () => counterCubit,
			act: (cubit) => cubit.multiplyByTen(),
			expect: () => [CounterState(counterValue: 0)], // Initial value multiplied by 10
		);
	});

	group('CounterScreen Widget Tests', () {
		late CounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
			when(() => mockCounterCubit.state).thenReturn(CounterState(counterValue: 0));
		});

		testWidgets('displays initial counter value', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);
			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('calls increment when increment button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);
			await tester.tap(find.byIcon(Icons.add));
			verify(() => mockCounterCubit.increment()).called(1);
		});

		testWidgets('calls multiplyByTen when multiply button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);
			await tester.tap(find.byIcon(Icons.close));
			verify(() => mockCounterCubit.multiplyByTen()).called(1);
		});
	});
}
