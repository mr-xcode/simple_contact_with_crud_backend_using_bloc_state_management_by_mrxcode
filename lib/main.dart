import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/blocs/read/cubit/get_contact_cubit.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/module.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/screens/home_screen.dart';

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
