import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneer/view/home/home.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  bool isLoading = false;
  void login({
    context,
    required String email,
    required String password,
  }) {
    isLoading = true;
    emit(ChangeStateToLoading());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const HomeScreen()));
    }).catchError((onError) {
      isLoading = false;
      emit(ChangeStateToLoading());
    });
  }
}
