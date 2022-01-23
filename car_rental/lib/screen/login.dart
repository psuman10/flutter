import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import '/http/httpuser.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginform = GlobalKey<FormState>();

  String uname = '';
  String pass = '';

  Future<bool> loginPost(String uname, String pass) {
    var res = HttpConnectUser().loginPosts(uname, pass);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/carrr.jpg"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: loginform,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          height: 6.5,
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
                  const SizedBox(height: 30),
                  TextFormField( style: const TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                    
                    onSaved: (value) {
                      uname = value!;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 4.0),
                          ),
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 6.0)),
                       fillColor: Colors.white,
                      labelText: 'Username',
                      hintText: 'Enter Username',
                      
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                     style: const TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                    
                    onSaved: (newValue) {
                      pass = newValue!;
                    },
                    obscureText: true,
                    decoration:  InputDecoration(
                      enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 4.0),
                          ),
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 6.0)),
                       fillColor: Colors.white,
                      labelText: 'Password',
                      hintText: 'Enter Password',
                   
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () async {
                      loginform.currentState!.save();
                      var res = await loginPost(uname, pass);
                      if (res) {
                        Navigator.pushNamed(context, '/userprofile');
                        MotionToast.success(
                          description: const Text('Login Successfull'),
                          toastDuration: const Duration(seconds: 1),
                        ).show(context);
                      } else {
                        MotionToast.error(description: const Text('Login UnSuccessfull'))
                            .show(context);
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: 'New User?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          
                          // ,
                        ),
                      ),
                      TextSpan(
                        text: ' Register Here',
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
