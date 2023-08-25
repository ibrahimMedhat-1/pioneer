import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/fixture_model.dart';

part 'archive_fixtures_state.dart';

class ArchiveFixturesCubit extends Cubit<ArchiveFixturesState> {
  ArchiveFixturesCubit() : super(ArchiveFixturesInitial());
  static ArchiveFixturesCubit get(context) => BlocProvider.of(context);
  List<FixtureModel> fixtures = [];
  List<TableRow> tableRows = [
    TableRow(children: [
      Column(children: [Text('الدكتور', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('اسم المعمل', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('تاريخ استلام التركيبه', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('تاريخ الطبعه', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('الاسم', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
    ]),
  ];
  void getAllFixture() {
    FirebaseFirestore.instance.collection('allFixtures').orderBy('printDate', descending: true).get().then((value) {
      value.docs.forEach((element) {
        fixtures.add(FixtureModel.fromJson(element.data()));
        setTable();
        emit(GetAllFixturesSuccessfully());
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  void setTable() {
    tableRows = [
      TableRow(children: [
        Column(children: [Text('الدكتور', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('اسم المعمل', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('تاريخ استلام التركيبه', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('تاريخ الطبعه', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('الاسم', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      ]),
    ];
    fixtures.forEach((element) {
      tableRows.add(TableRow(children: [
        Column(children: [Text(element.drName.toString(), style: TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.labName.toString(), style: TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.receiveDate.toString(), style: TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.printDate.toString(), style: TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.patientName.toString(), style: TextStyle(fontSize: 20.0))]),
      ]));
      emit(GetAllFixturesSuccessfully());
    });
  }
}
