
import 'package:flutter/material.dart';
import 'package:pioneer/home/home.dart';


class LoginScreen extends StatelessWidget {

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(image: AssetImage('assits/pioneer.jpg')),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold,color: Colors.blue),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your eamil';
                      } else
                        return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelStyle: TextStyle(color: Colors.grey[700]),
                        hintText: 'Enter the email',
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your password';
                      } else
                        return null;
                    },
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    // obscureText: cubit.obscure,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        labelStyle: TextStyle(color: Colors.grey[700]),
                        hintText: 'Enter the Password',
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        // suffixIcon: IconButton(
                        //   onPressed: () {
                        //     // cubit.changeObscure();
                        //   },
                        //   icon: cubit.obscure
                        //       ? Icon(
                        //     Icons.remove_red_eye,
                        //     color: Colors.blue,
                        //   )
                        //       : Icon(
                        //     Icons.visibility_off_sharp,
                        //     color: Colors.blue,
                        //   ),
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // cubit.isloading==false?
                  Container(
                    width: 180.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.blue,
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // cubit.Login(context: context);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));
                        }
                      },
                      child: Text(style: TextStyle(color: Colors.white,
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold), 'LOGIN'),
                    ),
                  )]
                      // : CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
