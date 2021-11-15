
import 'package:flutter/material.dart';
import 'screen/Loading.dart';


void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'firebase',
      home: Loading(),
    );
  }
}
