import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:pioneer/view_model/booking_cubit/booking_cubit.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String stringDate = 'التاريخ';
  final TextEditingController priceController = TextEditingController();
  final TextEditingController fileNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void selectDate(context) async {
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
        setState(() {
          stringDate = '${value!.year}-${value.month}-${value.day}';
        });
      });
    }

    return BlocProvider(
      create: (context) => BookingCubit(),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          BookingCubit cubit = BookingCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white), 'المواعيد'),
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
                      height: 25,
                    ),
                    TextFormField(
                      controller: cubit.patientPhoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                          hintText: 'رقم التليفون',
                          prefixIcon: const Icon(
                            Icons.call,
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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: priceController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelStyle: TextStyle(
                                  color: Colors.grey[700],
                                ),
                                hintText: 'المبلغ',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: fileNoController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelStyle: TextStyle(
                                  color: Colors.grey[700],
                                ),
                                hintText: 'رقم الملف',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
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
                          child: InkWell(
                            onTap: () {
                              selectDate(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              height: 50,
                              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  stringDate,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
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
                              cubit.addPatient(
                                drName: cubit.drNameValue.toString(),
                                patientName: cubit.patientNameController.text,
                                patientPhone: cubit.patientPhoneController.text,
                                date: stringDate.toString(),
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
