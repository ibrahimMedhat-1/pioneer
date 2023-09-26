import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneer/view/login/login.dart';
import 'package:pioneer/view_model/auth_cubit/auth_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseDartFlutter.setup();
  // Firestore.initialize("dentist-system-cbc47");
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //       apiKey: "AIzaSyAetq0h2Pih_E0UqHO53zb9xjT5pPAOfZk",
  //       authDomain: "dentist-system-cbc47.firebaseapp.com",
  //       projectId: "dentist-system-cbc47",
  //       storageBucket: "dentist-system-cbc47.appspot.com",
  //       messagingSenderId: "520181459755",
  //       appId: "1:520181459755:web:70cf3e69d779cc4d7df36e",
  //       measurementId: "G-B0MMKBHYV9"),
  // );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  ));
}
