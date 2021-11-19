
import 'package:flutter/material.dart';
import 'screen/Loading.dart';
import 'package:get/get.dart';


void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String scity = '';
    return GetMaterialApp(
      title: 'firebase',
      home: Loading(scity),
    );
  }
}
