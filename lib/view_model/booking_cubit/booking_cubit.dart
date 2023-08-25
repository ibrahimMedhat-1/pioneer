import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  static BookingCubit get(context) => BlocProvider.of(context);
  TextEditingController patientNameController = TextEditingController();
  TextEditingController patientPhoneController = TextEditingController();
  String? drNameValue;
  bool isLoading = false;
  String stringDate = 'Date';
  String? docId;
  void changeDate(value) {
    stringDate = value;
    emit(ChangeDate());
  }

  void addPatient({
    required String drName,
    required String patientName,
    required String patientPhone,
    required String date,
  }) {
    isLoading = true;
    emit(IsLoading());
    var name = drName.split('/');
    drName = name.join();
    FirebaseFirestore.instance.collection('doctors').doc(drName).collection('patients').add({
      'name': patientName,
      'phoneNo': patientPhone,
      'drName': drName,
      'date': date,
      'price': int.parse('0'),
      'fileNo': int.parse('0'),
    }).then((value) async {
      docId = value.id;
      await FirebaseFirestore.instance.collection('doctors').doc(drName).collection('patients').doc(docId).update({'id': docId}).then((value) {
        FirebaseFirestore.instance.collection('allDates').doc(docId).set({
          'name': patientName,
          'phoneNo': patientPhone,
          'drName': drName,
          'date': date,
          'id': docId,
          'price': int.parse('0'),
          'fileNo': int.parse('0'),
        }).then((value) {
          patientNameController.text = '';
          patientPhoneController.text = '';
          isLoading = false;
          emit(PatientAddedSuccessfully());
        }).catchError((onError) {
          isLoading = false;
          emit(PatientAddedSuccessfully());
        });
      });
      patientNameController.text = '';
      patientPhoneController.text = '';
      isLoading = false;
      emit(PatientAddedSuccessfully());
    }).catchError((onError) {
      isLoading = false;
      emit(PatientAddedSuccessfully());
    });
  }
}
