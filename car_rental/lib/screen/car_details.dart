import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:unicons/unicons.dart';

class DetailsPage extends StatefulWidget {

  const DetailsPage({
    
    Key? key,}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
  
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
         
          leading: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: InkWell(
               onTap: () {
                Navigator.pushNamed(context, '/nav');
              },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius:  BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Icon(
                    UniconsLine.multiply,
                    color: Colors.black,
                    size: size.height * 0.03,
                  ),
                ),
              ),
            ),
          ), 
        ),
      ),
        body:Container(
          



        ),
        
        
        
      
      
        
      
      
    );
  }
}
