import 'package:flutter/material.dart';

class ArchivesFixtures extends StatelessWidget {
  const ArchivesFixtures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              'الارشيف'),
        ),
       body:Padding(
        padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
    child: Column(
    children: [
    TextFormField(
    keyboardType: TextInputType.text,
    onFieldSubmitted: (String value) {
    print(value);
    },
    onChanged: (String value) {
    print(value);
    },
    decoration: InputDecoration(
    hintStyle:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
    hintText: 'البحث',
    prefixIcon: const Icon(
    Icons.search,
    color: Colors.black,
    ),
    focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue),
    ),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20))),
    ),
       Center(
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    defaultColumnWidth: const FixedColumnWidth(300.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: const [
                      TableRow( children: [
                        Column(children:[Text('الدكتور', style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold))]),
                        Column(children:[Text('اسم المعمل', style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold))]),
                        Column(children:[Text('تاريخ استلام التركيبة', style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold))]),
                        Column(children:[Text('تاريخ الطبعه', style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold))]),
                        Column(children:[Text('الاسم', style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('شاهر ابوحلقان', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('البرج', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('25/12/2023',style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('25/12/2023',style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('محمود احمد محمد',style: TextStyle(fontSize: 20.0))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('شاهر ابوحلقان', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('البرج', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('25/12/2023',style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('25/12/2023',style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('ابراهيم مدحت ابراهيم',style: TextStyle(fontSize: 20.0))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('شاهر ابوحلقان', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('البرج', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('25/12/2023',style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('25/12/2023',style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('محمد احمد محمد',style: TextStyle(fontSize: 20.0))]),
                      ]),
                    ],
                  ),
                ),
              ),
            ])
        )
    ]))));
  }
}
