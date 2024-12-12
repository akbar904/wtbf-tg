
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/models/counter_state.dart';

void main() {
	group('CounterState Model Tests', () {
		test('CounterState should be initialized with a counter value', () {
			final counterState = CounterState(counterValue: 0);
			expect(counterState.counterValue, 0);
		});

		test('CounterState should correctly update counter value', () {
			final counterState = CounterState(counterValue: 0);
			counterState.counterValue = 10;
			expect(counterState.counterValue, 10);
		});

		test('CounterState should serialize to JSON', () {
			final counterState = CounterState(counterValue: 10);
			final json = counterState.toJson();
			expect(json, {'counterValue': 10});
		});

		test('CounterState should deserialize from JSON', () {
			final json = {'counterValue': 10};
			final counterState = CounterState.fromJson(json);
			expect(counterState.counterValue, 10);
		});
	});
}
