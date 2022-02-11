
// ignore_for_file: file_names
import 'dart:io';
import 'package:car_rental/navbar/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formkey = GlobalKey<FormState>();
  File? _image;

  String fname = '';
  String email = '';
  String gender = '';
  String add = '';

  @override
  void initState() {
    super.initState();
    _image = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
         centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.multiply),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavBottompract()),
              );
            },
            color: Colors.white,
          )
        ],
      ),
      body: SizedBox(
        height: 800,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/carrrr.jpg"),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Text(
                        'User Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            height: 2,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _image == null
                              ? const AssetImage('assets/images/Profile Image.png')
                                  as ImageProvider
                              : FileImage(_image!),
                          child: InkWell(
                            onTap: () {},
                              
                            
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (value) {
                        fname = value!;
                      },
                      
                      decoration: InputDecoration(
                         enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 4.0),
                          ),
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 6.0)),
                       fillColor: Colors.white,
                        labelText: 'Username:',
                        
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                      decoration:  InputDecoration(
                         enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 4.0),
                          ),
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 6.0)),
                       fillColor: Colors.white,
                        labelText: 'Email:',
                     
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (newValue) {
                        gender = newValue!;
                      },
                      decoration:  InputDecoration(
                         enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 4.0),
                          ),
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 6.0)),
                       fillColor: Colors.white,
                        labelText: 'Gender:',
                      
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (newValue) {
                        add = newValue!;
                      },
                      decoration:  InputDecoration(
                         enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 4.0),
                          ),
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 6.0)),
                       fillColor: Colors.white,
                        labelText: 'Address:',
                     
                      ),
                    ),
                    
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {},
                      
                      child: const Text('Update Profile'),
                      
                    ),
                    const SizedBox(height: 10),
                  ],
                )),
          ),
        ),
      ),
    );
  }

}
