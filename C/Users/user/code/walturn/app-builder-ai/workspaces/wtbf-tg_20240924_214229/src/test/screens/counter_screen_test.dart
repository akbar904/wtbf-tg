
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/screens/counter_screen.dart';

// Mock CounterCubit for testing purposes
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterScreen Widget Tests', () {
		late MockCounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
		});

		testWidgets('Initial counter value is displayed', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('Increment button is displayed', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.byIcon(Icons.add), findsOneWidget);
		});

		testWidgets('Multiply by 10 button is displayed', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.text('Multiply by 10'), findsOneWidget);
		});

		testWidgets('Counter value increments when increment button is tapped', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);
			whenListen(
				mockCounterCubit,
				Stream.fromIterable([0, 1]),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.add));
			await tester.pump();

			expect(find.text('1'), findsOneWidget);
		});

		testWidgets('Counter value multiplies by 10 when multiply button is tapped', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(1);
			whenListen(
				mockCounterCubit,
				Stream.fromIterable([1, 10]),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);

			await tester.tap(find.text('Multiply by 10'));
			await tester.pump();

			expect(find.text('10'), findsOneWidget);
		});
	});
}
