
import 'package:bloc/bloc.dart';
import 'package:bloc_apps/features/project1/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Project1Page extends StatelessWidget {
  const Project1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const Project1View(),
    );
  }
}

class Project1View extends StatelessWidget {
  const Project1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: const Text('Inc'),
          ),
          TextButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: const Text('Dec'),
          ),
        ],
      ),
    );
  }
}
