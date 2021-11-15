import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class weather extends StatefulWidget {
  weather({this.parseWeatherData});

  final dynamic parseWeatherData;

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  late String cityname;
  late int temp;
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toInt();
    cityname = weatherData['name'];
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.near_me),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_searching),
          )
        ],
      ),
      body: Container(
        color: Colors.orange,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              // Image.asset(
              //   'image/background.jpg',
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: double.infinity,
              // ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Text(
                              '$cityname',
                              style: GoogleFonts.lato(
                                  fontSize: 40, color: Colors.white),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  Duration(minutes: 1),
                                  builder: (context) {
                                    print('${getSystemTime()}');
                                    return Text(
                                      '${getSystemTime()}',
                                      style:
                                          GoogleFonts.lato(color: Colors.white),
                                    );
                                  },
                                ),
                                Text(
                                  DateFormat(' - EEEE MMM d yyyy').format(date),
                                  style: GoogleFonts.lato(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85, color: Colors.white),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('svg/climacon-sun.svg',),
                                Text(
                                  'good day',
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        height: 16,
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text(
                              'AQI 지수',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('image/good.png',
                            width: 50,
                            height: 50,),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '나쁨',
                            ),
                          ]),
                          Column(children: [
                            Text(
                              '미세먼지',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('222.22',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '나쁨',
                            ),
                          ]),
                          Column(children: [
                            Text(
                              '초미세먼지',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('222.22',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '나쁨',
                            ),
                          ]),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
