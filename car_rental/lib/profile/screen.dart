// ignore_for_file: file_names
import 'dart:io';
import 'package:car_rental/http/httpuser.dart';
import 'package:car_rental/http/httpuserprofile.dart';
import 'package:car_rental/model/profile.dart';
import 'package:car_rental/navbar/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  final userprofile? model;
  const UserProfile({Key? key, this.model}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  String? fname;
  String? email;
  String? gender;
  String? address;
  File? _image;
  late Future<userprofile> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = HttpConnectprofile.getUserById(" 621b8fca935e04f2931e5470");
   
  }
    
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: FutureBuilder<userprofile>(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child:

                    Text("${snapshot.data!.address}"),
                        // ListTile(
                        //   title: Text('$index'),
                        //   subtitle: Text(
                        //     '${snapshot.data![index].fullname} \t ${snapshot.data![index].address}   ',
                        //   ),
                        // ),
                        // myCard(snapshot.data![index]),
                );
                },

                // ListTile(
                //   title: Text('$index'),
                //   subtitle: Text(
                //     '${snapshot.data![index].fullname} \t ${snapshot.data![index].address}   ',
                //   ),
                // );
                );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}





      // body: SizedBox(
      //   height: size.height * 1,
      //   child: Container(
      //     decoration: const BoxDecoration(
      //         image: DecorationImage(
      //       image: AssetImage("assets/images/carrrr.jpg"),
      //       fit: BoxFit.cover,
      //     )),
      //     child: SingleChildScrollView(
      //       padding: const EdgeInsets.all(20),
      //       child: Form(
      //           key: _formKey,
      //           child: Column(
      //             children: [
      //               const Text(
      //                 'User Profile',
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 40,
      //                     height: 2,
      //                     fontWeight: FontWeight.bold),
      //                 textAlign: TextAlign.center,
      //               ),
      //               Stack(
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 50,
      //                     backgroundImage: _image == null
      //                         ? const AssetImage(
      //                                 'assets/images/Profile Image.png')
      //                             as ImageProvider
      //                         : FileImage(_image!),
      //                     child: InkWell(
      //                       onTap: () {},
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(height: 20),
      //               TextFormField(
      //                 onSaved: (value) {
      //                   fname = value!;
      //                 },
      //                 decoration: InputDecoration(
      //                   enabledBorder: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(20),
      //                     borderSide:
      //                         const BorderSide(color: Colors.grey, width: 4.0),
      //                   ),
      //                   labelStyle: const TextStyle(
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                   focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(
      //                           color: Colors.red, width: 6.0)),
      //                   fillColor: Colors.white,
      //                   labelText: 'Username:',
      //                 ),
      //               ),
      //               const SizedBox(height: 20),
      //               TextFormField(
      //                 onSaved: (newValue) {
      //                   email = newValue!;
      //                 },
      //                 decoration: InputDecoration(
      //                   enabledBorder: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(20),
      //                     borderSide:
      //                         const BorderSide(color: Colors.grey, width: 4.0),
      //                   ),
      //                   labelStyle: const TextStyle(
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                   focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(
      //                           color: Colors.red, width: 6.0)),
      //                   fillColor: Colors.white,
      //                   labelText: 'Email:',
      //                 ),
      //               ),
      //               const SizedBox(height: 20),
      //               TextFormField(
      //                 onSaved: (newValue) {
      //                   gender = newValue!;
      //                 },
      //                 decoration: InputDecoration(
      //                   enabledBorder: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(20),
      //                     borderSide:
      //                         const BorderSide(color: Colors.grey, width: 4.0),
      //                   ),
      //                   labelStyle: const TextStyle(
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                   focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(
      //                           color: Colors.red, width: 6.0)),
      //                   fillColor: Colors.white,
      //                   labelText: 'Gender:',
      //                 ),
      //               ),
      //               const SizedBox(height: 20),
      //               TextFormField(
      //                 onSaved: (newValue) {
      //                   address = newValue!;
      //                 },
      //                 decoration: InputDecoration(
      //                   enabledBorder: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(20),
      //                     borderSide:
      //                         const BorderSide(color: Colors.grey, width: 4.0),
      //                   ),
      //                   labelStyle: const TextStyle(
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                   focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(
      //                           color: Colors.red, width: 6.0)),
      //                   fillColor: Colors.white,
      //                   labelText: 'Address:',
      //                 ),
      //               ),
      //               const SizedBox(height: 20.0),
      //               ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                   minimumSize: const Size(double.infinity, 50),
      //                 ),
      //                 onPressed: () {},
      //                 child: const Text('Update Profile'),
      //               ),
      //               const SizedBox(height: 10),
      //             ],
      //           )),
      //     ),
      //   ),
      // ),
//     );
//   }
// }
