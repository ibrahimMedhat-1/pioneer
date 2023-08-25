import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pioneer/model/patient_model.dart';

class PricePage extends StatelessWidget {
  final PatientModel patientModel;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController fileNoController = TextEditingController();

  PricePage({super.key, required this.patientModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('doctors').doc(patientModel.drName).collection('patients').doc(patientModel.id).update({
                  'price': int.parse(priceController.text),
                  'fileNo': int.parse(fileNoController.text),
                }).then((value) {
                  Navigator.pop(context);
                });
                FirebaseFirestore.instance.collection('allDates').doc(patientModel.id).update({
                  'price': int.parse(priceController.text),
                  'fileNo': int.parse(fileNoController.text),
                }).then((value) {
                  Navigator.pop(context);
                });
              },
              child: const Text(
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  'تسجيل'))
        ],
      ),
    );
  }
}
