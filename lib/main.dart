import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneer/view/expenses/expenses.dart';
import 'package:pioneer/view_model/auth_cubit/auth_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  ));
}
