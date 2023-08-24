import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:pioneer/view_model/fixtures_cubit/fixtures_cubit.dart';

class Fixtures extends StatefulWidget {
  const Fixtures({super.key});

  @override
  State<Fixtures> createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  String stringDate = 'Date';

  @override
  Widget build(BuildContext context) {
    String? dateTime;
    Future<String> selectDate(context) async {
      await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.blue, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          }).then((value) {
        dateTime = '${value!.year}-${value!.month}-${value!.day}';
      });
      return dateTime!;
    }

    return BlocProvider(
      create: (context) => FixturesCubit(),
      child: BlocConsumer<FixturesCubit, FixturesState>(
        listener: (context, state) {},
        builder: (context, state) {
          FixturesCubit cubit = FixturesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white), 'التركيبات'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: cubit.patientNameController,
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
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              cubit.changePrintDate(await selectDate(context));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              height: 60,
                              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white), cubit.stringPrintDate),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              cubit.changeReceiveDate(await selectDate(context));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              height: 60,
                              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child:
                                    Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white), cubit.stringReceiveDate),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 65,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.blue),
                            child: Center(
                              child: DropDown(
                                // isExpanded: true,
                                showUnderline: false,
                                items: const ["د/ محمد وحيد ", "د/ محمد خالد القاضي", "د/ حسام ابو الحلقان", "د/ لمياء خليفة", "د/ هبة ممدوح"],
                                hint: const Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white), 'الدكتور'),
                                icon: const Icon(
                                  size: 35,
                                  Icons.expand_more,
                                  color: Colors.white,
                                ),
                                onChanged: (value) {
                                  cubit.drNameValue = value;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cubit.labNameController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelStyle: TextStyle(
                                  color: Colors.grey[700],
                                ),
                                hintText: 'اسم المعمل ',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    cubit.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              cubit.addFixture(
                                patientName: cubit.patientNameController.text,
                                printDate: cubit.stringPrintDate,
                                receiveDate: cubit.stringReceiveDate,
                                labName: cubit.labNameController.text,
                                drName: cubit.drNameValue!,
                              );
                            },
                            child: const Text(
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                'تسجيل'))
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
