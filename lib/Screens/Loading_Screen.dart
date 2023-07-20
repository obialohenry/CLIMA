import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:clima/Weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Location_Screen.dart';

// ignore: constant_identifier_names
const SpinKit = SpinKitDoubleBounce(
  color: Colors.green,
  size: 100.0,
);

// ignore: use_key_in_widget_constructors
class Loading_Screen extends StatefulWidget {
  static const String id = "Loading_Screen";
  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  // ignore: non_constant_identifier_names

  Future<Map<String, dynamic>> dataFromWeather() async {
    Weather weather = Weather();
    Map<String, dynamic> data = await weather.locationData();
    return data;
  }
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dataFromWeather();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Location_Screen(locationData: snapshot.data);
          } else if (snapshot.hasError) {
            return Location_Screen(locationData: snapshot.error);
          } else {
            return SpinKit;
          }
        },
        future: dataFromWeather(),
      ),
    );
  }
}
