import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class Expenses extends StatefulWidget {

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  String stringDate = 'Date';

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime;
    void selectDate(context) async {
      dateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.blue, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.black, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          });
      setState(() {
        stringDate = '${dateTime!.year}-${dateTime!.month}-${dateTime!.day}';
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
            'المصروفات'),
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
                    hintText: 'التفاصيل ',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
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
                    child: InkWell(
                      onTap: () {
                        selectDate(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        height: 65,
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white), 'التاريخ'),
                        ),
                      ),
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
