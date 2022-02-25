import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/blocs/counter/counter_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(IncrementEvent());
                },
                child: const Icon(Icons.exposure_plus_1),
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, CounterState state) {
                  return Text(
                    "${state.number}",
                    style: TextStyle(fontSize: 40),
                  );
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(DecrementEvent());
                },
                child: const Icon(Icons.exposure_minus_1),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
