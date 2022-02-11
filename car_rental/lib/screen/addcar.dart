// ignore_for_file: file_names
import 'dart:io';
import 'package:car_rental/http/httpaddcar.dart';
import 'package:car_rental/model/addcar_model.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCar> {
  final addcarform = GlobalKey<FormState>();
  String name = '';
  String image = '';
  String capacity = '';
  String fuelType = '';
  String rentPerHour = '';

  Future<bool> addCar(Car c) {
    var res = HttpCar().registerCar(c);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 800,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/carrrrr.jpg"),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: addcarform,
                child: Column(
                  children: [
                    const Text(
                      'Add Product',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          height: 2,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (value) {
                        name = value!;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 4.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 6.0)),
                        fillColor: Colors.white,
                        labelText: 'Product Name:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (newValue) {
                        image = newValue!;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 4.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 6.0)),
                        fillColor: Colors.white,
                        labelText: 'Product Image URL:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (newValue) {
                        capacity = newValue!;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 4.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 6.0)),
                        fillColor: Colors.white,
                        labelText: 'Capacity:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (newValue) {
                        fuelType = newValue!;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 4.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 6.0)),
                        fillColor: Colors.white,
                        labelText: 'FuelType:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (newValue) {
                        rentPerHour = newValue!;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 4.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 6.0)),
                        fillColor: Colors.white,
                        labelText: 'Rent Per Hour:',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () async {
                        if (addcarform.currentState!.validate()) {
                          addcarform.currentState!.save();
                          Car c = Car(
                              name: name,
                              image: image,
                              capacity: capacity,
                              fuelType: fuelType,
                              rentPerHour: rentPerHour);
                          if (await addCar(c)) {
                            MotionToast.success(
                                    description:
                                        const Text('Car added Successfully'))
                                .show(context);
                            // Navigator.pushNamed(context, '/nav');
                          } else {
                            MotionToast.error(
                                    description:
                                        const Text('failed to add Car'))
                                .show(context);
                          }
                        }
                      },
                      child: const Text('Add Car'),
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
