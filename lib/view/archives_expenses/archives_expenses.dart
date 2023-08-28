import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneer/view_model/archives_expenses_cubit/archives_expenses_cubit.dart';

class ArchiveExpenses extends StatelessWidget {
  const ArchiveExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArchivesExpensesCubit()..getAllExpenses(),
      child: BlocConsumer<ArchivesExpensesCubit, ArchivesExpensesState>(
        listener: (context, state) {},
        builder: (context, state) {
          ArchivesExpensesCubit cubit = ArchivesExpensesCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                centerTitle: true,
                title: const Text(style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), 'الارشيف'),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          hintText: 'البحث',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                    ),
                    Center(
                        child: Column(children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Table(
                            defaultColumnWidth: const FixedColumnWidth(300.0),
                            border: TableBorder.all(color: Colors.black, style: BorderStyle.solid, width: 2),
                            children: cubit.tableRows,
                          ),
                        ),
                      ),
                    ]))
                  ]))));
        },
      ),
    );
  }
}
