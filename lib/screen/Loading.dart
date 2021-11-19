import 'package:flutter/material.dart';
import 'package:flutter_login/mylocation.dart';
import 'package:flutter_login/network.dart';
import 'package:flutter_login/screen/weather.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

const String api = '672d167165382a883ea3c5e9851756be';

class Loading extends StatefulWidget {
  Loading(this.scity);
  final String scity;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double lat2;
  late double lon2;



  initState() {
    super.initState();
    getLocation(widget.scity);
  }

  void getLocation(String scity) async {
    print(scity);
    if(scity == ''){
      Mylocation mylocation = Mylocation();
      await mylocation.getLocation();
      lat2 = mylocation.lat;
      lon2 = mylocation.lon;
      print("$lat2 + $lon2");
    }else {

    }


    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather'
            '?lat=$lat2&lon=$lon2&appid=$api&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution'
            '?lat=$lat2&lon=$lon2&appid=$api');
    // Network network = Network(
    //     'https://api.openweathermap.org/data/2.5/weather?q=London&appid=$api&units=metric',
    //     'https://api.openweathermap.org/data/2.5/air_pollution'
    //         '?lat=$lat2&lon=$lon2&appid=$api');

    var weatherData = await network.getjsonData();
    print(weatherData);
    var airdata = await network.airdata();
    print(airdata);
    Get.off(weather(weatherData,airdata));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LoadingDoubleFlipping.square(
        backgroundColor: Colors.lightBlue,
        borderColor: Colors.lightBlue,
      )
          /*child: ElevatedButton(
            onPressed: () {
              getLocation();
              // null;
            },
            child: Text('location')),*/
          ),
    );
  }
}
