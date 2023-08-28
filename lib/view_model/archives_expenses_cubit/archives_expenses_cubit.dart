import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/expenses_model.dart';

part 'archives_expenses_state.dart';

class ArchivesExpensesCubit extends Cubit<ArchivesExpensesState> {
  ArchivesExpensesCubit() : super(ArchivesExpensesInitial());
  static ArchivesExpensesCubit get(context) => BlocProvider.of(context);
  List<ExpensesModel> expenses = [];
  List<TableRow> tableRows = [
    const TableRow(children: [
      Column(children: [Text('التاريخ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('المبلغ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      Column(children: [Text('المصروفات', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
    ]),
  ];

  void getAllExpenses() {
    FirebaseFirestore.instance.collection('Expenses').orderBy('date', descending: true).get().then((value) {
      for (var element in value.docs) {
        expenses.add(ExpensesModel.fromJson(element.data()));
        setTable();
        emit(GetAllExpensesSuccessfully());
      }
    }).catchError((onError) {});
  }

  void setTable() {
    tableRows = [
      const TableRow(children: [
        Column(children: [Text('التاريخ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('المبلغ', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
        Column(children: [Text('المصروفات', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))]),
      ]),
    ];
    for (var element in expenses) {
      tableRows.add(TableRow(children: [
        Column(children: [Text(element.date.toString(), style: const TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.price.toString(), style: const TextStyle(fontSize: 20.0))]),
        Column(children: [Text(element.details.toString(), style: const TextStyle(fontSize: 20.0))]),
      ]));
      emit(GetAllExpensesSuccessfully());
    }
  }
}
