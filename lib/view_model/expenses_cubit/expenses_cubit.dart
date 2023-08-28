import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());

  static ExpensesCubit get(context) => BlocProvider.of(context);
  bool isLoading = false;
  String stringDate = 'التاريخ';
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void changeDate(value) {
    stringDate = value;
    emit(ChangeDate());
  }

  void addDetails({
    required String details,
    required String price,
    required String date,
  }) {
    isLoading = true;
    emit(IsLoading());
    FirebaseFirestore.instance.collection('Expenses').add({
      'details': details,
      'price': price,
      'date': date,
    }).then((value) {
      String docId = value.id;
      FirebaseFirestore.instance.collection('Expenses').doc(docId).update({'id': docId});
      FirebaseFirestore.instance.collection('ExpensesDoctor').doc(docId).set({
        'details': details,
        'price': price,
        'date': date,
        'id': docId,
      });
      detailsController.text = '';
      priceController.text = '';
      stringDate = 'التاريخ';
      isLoading = false;
      emit(ExpensesAddedSuccessfully());
    }).catchError((onError) {
      isLoading = false;
      emit(ExpensesAddedSuccessfully());
    });
  }
}
