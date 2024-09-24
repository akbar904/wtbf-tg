
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Counter App'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
							'You have pushed the button this many times:',
						),
						BlocBuilder<CounterCubit, int>(
							builder: (context, count) {
								return Text(
									'$count',
									style: Theme.of(context).textTheme.headline4,
								);
							},
						),
					],
				),
			),
			floatingActionButton: Column(
				mainAxisAlignment: MainAxisAlignment.end,
				children: [
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().increment(),
						tooltip: 'Increment',
						child: Icon(Icons.add),
					),
					SizedBox(height: 10),
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().multiplyByTen(),
						tooltip: 'Multiply by 10',
						child: Text('10x'),
					),
				],
			),
		);
	}
}
