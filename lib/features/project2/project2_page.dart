import 'package:bloc_apps/features/project1/counter_cubit.dart';
import 'package:bloc_apps/features/project2/names_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Project2Page extends StatelessWidget {
  const Project2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NamesCubit>(
      create: (_) => NamesCubit(userList: _userlist),
      child: const Project2View(),
    );
  }
}

class Project2View extends StatelessWidget {
  const Project2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Home Page'),
      ),
      body: BlocBuilder<NamesCubit, String?>(
        builder: (context, state) {
          final textButton = TextButton(
              onPressed: () {
                context.read<NamesCubit>().getRandomName();
              },
              child: Text('Fetch User'));
          if (state != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  textButton
                ],
              ),
            );
          } else {
            return Center(
              child: textButton,
            );
          }
        },
      ),
    );
  }
}

const Iterable<String> _userlist = <String>[
  'Mehmet',
  'Ali',
  'Ömer',
  'Monreo',
  'Collins',
  'Anissa',
  'Padberg'
];
