import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print('InitState fun ran');
  }

  static Map data = {};


  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.black;



    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data['time'] = result['time'];
                    data['location'] = result['location'];
                    data['isDayTime'] = result['isDayTime'];
                    data['flag'] = result['flag'];
                  });
                  },
                icon: Icon(Icons.pin_drop, color: Colors.white,),
                label: Text(
                  "Edit Location",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                      color: Colors.white, fontSize: 28, letterSpacing: 2),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              data['time'],
              style: TextStyle(
                  color: Colors.white, fontSize: 37, letterSpacing: 2),
            )
          ],
        ),
      )),
    );
  }
}
