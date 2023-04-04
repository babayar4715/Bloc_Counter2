import 'dart:developer';

import 'package:counter_bloc2/bloc/second-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWithBloc extends StatelessWidget {
  const CounterWithBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: "Flutter demo",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                log('BlocBuilder ishtedi');
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              child: const Text(
                'Go to Second Page',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  increment() => emit(state + 1);
  decrement() => emit(state - 1);
}
