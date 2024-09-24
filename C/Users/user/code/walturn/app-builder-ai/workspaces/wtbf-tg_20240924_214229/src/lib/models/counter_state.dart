
import 'dart:convert';

class CounterState {
	int counterValue;

	CounterState({required this.counterValue});

	Map<String, dynamic> toJson() {
		return {
			'counterValue': counterValue,
		};
	}

	factory CounterState.fromJson(Map<String, dynamic> json) {
		return CounterState(
			counterValue: json['counterValue'],
		);
	}
}
