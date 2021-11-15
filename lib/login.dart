import 'package:flutter/material.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('image/glogo.png'),
                    Text('native',
                    style: TextStyle(fontSize: 20),),
                    Opacity(opacity: 0)
                  ],
                ),
                color: Colors.green,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlineButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('image/glogo.png'),
                  Text('google'),
                  Opacity(opacity: 0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
