import 'package:flutter/material.dart';

import '../archives/archives.dart';
import '../booking/booking.dart';
import '../daily_report/daily_report.dart';
import '../expenses/expenses.dart';
import '../fixtures/fixtures.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), 'Home Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: const Image(image: AssetImage('assits/pioneer.jpg')),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder) => const Booking()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23), 'المواعيد'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder) => const Expenses()));
                          },
                          child: const Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                      'المصروفات'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder) => const Fixtures()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23), 'التركيبات '),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
