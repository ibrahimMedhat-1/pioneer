import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class DailyReport extends StatelessWidget {
  const DailyReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
            'التقرير اليومي'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 60,),
              TextFormField(
                keyboardType: TextInputType.text,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                onChanged: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelStyle: TextStyle(color: Colors.grey[700],),
                    hintText: 'اسم المريض',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              SizedBox(height: 25,),
              Container(
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.blue),
                  child: Center(
                    child: DropDown(
                      // isExpanded: true,
                      showUnderline: false,
                      items: ["د/ محمد وحيد ", "د/ محمد خالد القاضي", "د/ حسام ابو الحلقان", "د/ لمياء خليفة", "د/ هبة ممدوح"],
                      hint: Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white), 'الدكتور'),
                      icon: Icon(
                        size: 35,
                        Icons.expand_more,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelStyle: TextStyle(color: Colors.grey[700],),
                          hintText: 'المبلغ',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelStyle: TextStyle(color: Colors.grey[700],),
                          hintText: 'رقم الملف',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){}, child: Text(

                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),
                  'تسجيل'))
            ],
          ),
        ),
      ),
    );
  }
}
