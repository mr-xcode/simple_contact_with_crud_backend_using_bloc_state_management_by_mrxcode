import 'package:Contact_Plus/blocs/read/cubit/get_contact_cubit.dart';
import 'package:Contact_Plus/module.dart';
import 'package:Contact_Plus/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Contact',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<GetContactCubit>(
        create: (context) => getIt.call(),
        child: const HomeScreen(),
      ),
    );
  }
}
