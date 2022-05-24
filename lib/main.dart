import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:flutter_themen_on/theme/theme_bloc.dart';
import 'package:flutter_themen_on/themen/themen_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemenCubit>(
      create: (context) => ThemenCubit(),
      child: BlocBuilder<ThemenCubit, ThemenState>(builder: (context, state) {
        return MaterialApp(
          title: 'Cubit Payload',
          debugShowCheckedModeBanner: false,
          theme: state.appThemen == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          // ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          home: const MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            print('randInt: $randInt');
            //Argument↓
            context.read<ThemenCubit>().changeThemen(randInt);
          },
          child: Text(
            'Change Theme',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
