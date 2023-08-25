import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/patient_model.dart';

part 'archive_daily_state.dart';

class ArchiveDailyCubit extends Cubit<ArchiveDailyState> {
  ArchiveDailyCubit() : super(ArchiveDailyInitial());

  static ArchiveDailyCubit get(context) => BlocProvider.of(context);
  List<PatientModel> patients = [];
  List<TableRow> tableRows = [
    const TableRow(children: [
      Column(children: [Text('رقم الملف', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('الدكتور', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('المبلغ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('رقم التليفون', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('الاسم', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
    ]),
  ];

  void getAllDates() {
    FirebaseFirestore.instance.collection('allDates').orderBy('date', descending: true).get().then((value) {
      for (var element in value.docs) {
        patients.add(PatientModel.fromJson(element.data()));
        setTable();
        emit(GetAllPatientsSuccessfully());
      }
    }).catchError((onError) {});
  }

  void setTable() {
    tableRows = [
      const TableRow(children: [
        Column(children: [Text('رقم الملف', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('الدكتور', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('المبلغ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('رقم التليفون', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('الاسم', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      ]),
    ];
    for (var element in patients) {
      tableRows.add(TableRow(children: [
        Column(children: [Text(element.fileNo.toString(), style: const TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.drName.toString(), style: const TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.price.toString(), style: const TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.phoneNo.toString(), style: const TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.name.toString(), style: const TextStyle(fontSize: 20.0))]),
      ]));
      emit(GetAllPatientsSuccessfully());
    }
  }
}
