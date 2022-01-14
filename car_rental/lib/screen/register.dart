import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:motion_toast/motion_toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final regform = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String gender = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/carr.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: regform,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'REGISTER',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        height: 3.25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, left: 120.0, right: 120.0, bottom: 12.0),
                    child: Divider(
                      thickness: 4,
                      color: Colors.red,
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    onSaved: (value) {
                      username = value!;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 4.0),
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 6.0)),
                      fillColor: Colors.white,
                      labelText: 'Username',
                      hintText: 'Enter your User name',
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(20),
                      //       borderSide: const BorderSide(
                      //           color: Colors.white, width: 4.0),
                      // ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    onSaved: (value) {
                      email = value!;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 4.0),
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 6.0)),
                      fillColor: Colors.white,
                      labelText: 'Email ID',
                      hintText: 'Enter your Email ID',
                      // border: OutlineInputBorder(),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Email is required'),
                      EmailValidator(errorText: 'Enter a valid Email ID')
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    onSaved: (value) {
                      gender = value!;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 4.0),
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 6.0)),
                      fillColor: Colors.white,
                      labelText: 'gender',
                      hintText: 'Enter your gender',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    onSaved: (value) {
                      password = value!;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 4.0),
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 6.0)),
                      fillColor: Colors.white,
                      labelText: 'Password',
                      hintText: 'Enter your Password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () async {},
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          // ,
                        ),
                      ),
                      TextSpan(
                        text: ' Sign In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                          color: Colors.white,

                          // decoration: TextDecoration.underline,
                          // decorationThickness: 2,
                        ),
                      ),
                    ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
