import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:pioneer/view/daily_report/price_page/price_page.dart';
import 'package:pioneer/view_model/daily_report_cubit/daily_report_cubit.dart';

class DailyReport extends StatelessWidget {
  const DailyReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyReportCubit(),
      child: BlocConsumer<DailyReportCubit, DailyReportState>(
        listener: (context, state) {},
        builder: (context, state) {
          DailyReportCubit cubit = DailyReportCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white), 'التقرير اليومي'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.blue),
                      child: Center(
                        child: DropDown(
                          showUnderline: false,
                          items: const ["د/ محمد وحيد ", "د/ محمد خالد القاضي", "د/ حسام ابو الحلقان", "د/ لمياء خليفة", "د/ هبة ممدوح"],
                          hint: Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white), cubit.drNameValue),
                          icon: const Icon(
                            size: 35,
                            Icons.expand_more,
                            color: Colors.white,
                          ),
                          onChanged: (value) {
                            cubit.drNameValue = value!;
                            cubit.getPatients();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onChanged: (String value) {
                        // cubit.searchPatient(value);
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                          hintText: 'اسم المريض',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        itemBuilder: (context, index) => cubit.patients.isNotEmpty
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => PricePage(patientModel: cubit.patients[index])));
                                },
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      cubit.patients[index].name!,
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.07),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: cubit.patients.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
