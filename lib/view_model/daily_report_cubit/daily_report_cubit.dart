import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/patient_model.dart';

part 'daily_report_state.dart';

class DailyReportCubit extends Cubit<DailyReportState> {
  DailyReportCubit() : super(DailyReportInitial());

  static DailyReportCubit get(context) => BlocProvider.of(context);
  List<PatientModel> patients = [];
  List<TableRow> tableRows = [
    const TableRow(children: [
      Column(children: [Text('الدكتور', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('المبلغ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('الاسم', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
    ]),
  ];
  double profit = 0;
  double waheed = 0;
  double qadi = 0;
  double hossam = 0;
  double heba = 0;
  double lamiaa = 0;
  double waheedFixtures = 0;
  double hossamFixtures = 0;
  double qadiFixtures = 0;
  double hebaFixtures = 0;
  double lamiaaFixtures = 0;
  double waheedPercentage = 0;
  double qadiPercentage = 0;
  double hossamPercentage = 0;
  double hebaPercentage = 0;
  double lamiaaPercentage = 0;
  double allExpenses = 0;
  double totalAmountVar = 0.0;

  void getAllDoctorPrices() {
    FirebaseFirestore.instance
        .collection('allDatesDoctorPioneer')
        .orderBy('date', descending: true)
        .get()
        .then((value) {
      for (var element in value.docs) {
        patients.add(PatientModel.fromJson(element.data()));
        setTable();
        emit(GetAllPatientsSuccessfully());
      }
    }).catchError((onError) {});
  }

  Future<void> totalAmount() async {
    totalAmountVar = 0;
    patients.forEach((element) {
      totalAmountVar += double.parse(element.price.toString());
    });
  }

  void delete(context) {
    FirebaseFirestore.instance.collection('allDatesDoctorPioneer').get().then((value) {
      for (var element in value.docs) {
        element.reference.delete();
        tableRows = [
          const TableRow(children: [
            Column(children: [Text('الدكتور', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
            Column(children: [Text('المبلغ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
            Column(children: [Text('الاسم', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
          ]),
        ];
        emit(DeleteAllPatients());
      }
    });
  }

  void deleteTable(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('حذف الجدول'),
              content: const Text('هل انت متاكد ؟ '),
              actions: [
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        delete(context);
                      },
                      child: const Text(
                        'نعم',
                        style: TextStyle(color: Colors.green),
                      ),
                    )),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'لا',
                        style: TextStyle(color: Colors.red),
                      ),
                    )),
                  ],
                )
              ],
            ));
  }

  void setTable() {
    tableRows = [
      const TableRow(children: [
        Column(children: [Text('الدكتور', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('المبلغ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('الاسم', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      ]),
    ];
    for (var element in patients) {
      tableRows.add(TableRow(children: [
        Column(children: [Text(element.drName.toString(), style: const TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.price.toString(), style: const TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.name.toString(), style: const TextStyle(fontSize: 20.0))]),
      ]));
      emit(GetAllPatientsSuccessfully());
    }
  }
}
