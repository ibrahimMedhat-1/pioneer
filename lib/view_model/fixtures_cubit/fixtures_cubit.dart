import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fixtures_state.dart';

class FixturesCubit extends Cubit<FixturesState> {
  FixturesCubit() : super(FixturesInitial());

  static FixturesCubit get(context) => BlocProvider.of(context);

  TextEditingController patientNameController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  String? drNameValue;
  bool isLoading = false;
  String stringPrintDate = 'تاريخ الطبعه';
  String stringReceiveDate = 'تاريخ استلام التركيبه';

  void changePrintDate(value) {
    stringPrintDate = value;
    emit(ChangePrintDate());
  }

  void changeReceiveDate(value) {
    stringReceiveDate = value;
    emit(ChangeReceiveDate());
  }

  void addFixture({
    required String patientName,
    required String printDate,
    required String receiveDate,
    required String labName,
    required String drName,
  }) {
    isLoading = true;
    emit(IsLoading());
    var name = drName.split('/');
    drName = name.join();
    FirebaseFirestore.instance.collection('doctors').doc(drName).collection('fixtures').add({
      'patientName': patientName,
      'printDate': printDate,
      'receiveDate': receiveDate,
      'labName': labName,
      'drName': drName,
    }).then((value) {
      String docId = value.id;
      FirebaseFirestore.instance.collection('doctors').doc(drName).collection('fixtures').doc(docId).update({'id': docId});
      emit(FixtureAddedSuccessfully());
    }).catchError((onError) {
      isLoading = false;
      emit(FixtureAddedSuccessfully());
    });
    FirebaseFirestore.instance.collection('allDates').doc(drName).collection('fixtures').add({
      'patientName': patientName,
      'printDate': printDate,
      'receiveDate': receiveDate,
      'labName': labName,
      'drName': drName,
    }).then((value) {
      String docId = value.id;
      FirebaseFirestore.instance.collection('allDates').doc(drName).collection('fixtures').doc(docId).update({'id': docId});
      isLoading = false;
      patientNameController.text = '';
      labNameController.text = '';
      stringPrintDate = 'تاريخ الطبعه';
      stringReceiveDate = 'تاريخ استلام التركيبه';

      emit(FixtureAddedSuccessfully());
    }).catchError((onError) {
      isLoading = false;
      emit(FixtureAddedSuccessfully());
    });
  }
}