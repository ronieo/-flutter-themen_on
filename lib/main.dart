import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:flutter_themen_on/theme/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),

      //...AppTheme 값마다 변경을 해야하기 때문에 MaterialApp을 BlocBuilder로 감싸는거임
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Event Payload',
            debugShowCheckedModeBanner: false,

            // 빌드 콜백에 전달된 state argument가 theme state type이므로,
            // state.appTheme 을 체크해서 그값이 앱테마.라이트와 같다면, 테마데이터.라이트에 어싸인하고,그게 아니라면 테마데이터.다크에 어싸인한다
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            // ThemeData(
            //   primarySwatch: Colors.blue,
            // ),
            home: const MyHomePage(),
          );
        },
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
        title: Text('Theme'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            print('randInt: $randInt');
            //Argument↓
            context.read<ThemeBloc>().add(ChangeThemeEvent(randInt: randInt));
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
