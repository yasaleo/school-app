import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/presentation/screens/home_screen.dart';

import 'cubit/navigation_cubit/navigation_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontWeight: FontWeight.bold),
        ),
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
        create: (context) => NavigationCubit(),
        child:  HomeScreen(),
      ),
    );
  }
}
