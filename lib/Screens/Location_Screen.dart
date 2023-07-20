import 'package:flutter/material.dart';
import 'package:clima/Weather.dart';
import 'City_Screen.dart';

// ignore: camel_case_types
class Location_Screen extends StatefulWidget {
  static const String id = "Location_Screen";
  // ignore: prefer_typing_uninitialized_variables
  final locationData;
  const Location_Screen({this.locationData});
  @override
  State<Location_Screen> createState() => _Location_ScreenState();
}

// ignore: camel_case_types
class _Location_ScreenState extends State<Location_Screen> with TickerProviderStateMixin {
  Weather weather = Weather();
  late String cityName;
  late int temp;
  late String cityId;
  late String cityNameText;
  late String text;
  bool pressed = false;

  void updateUI(dynamic uiData) {
    if (uiData == null) {
      temp = 0;
      cityName = "";
      cityId = "Error";
      cityNameText = "Couldn't get data";
      text = "";

      return;
    }
    cityName = uiData["name"];
    temp = uiData["main"]["temp"].toInt();
    var id = uiData["weather"][0]["id"];
    cityId = weather.getWeatherIcon(id);
    text = "in";
    String weatherText = weather.getMessage(temp);
    cityNameText = "$weatherText $text $cityName";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("lib/images/location_background.jpg"),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        pressed = true;
                      });
                      var presentLocationData = await weather.locationData();
                      setState(() {
                        pressed = false;
                        updateUI(presentLocationData);
                      });
                    },
                    child: pressed
                        ? const CircularProgressIndicator(
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.near_me,
                            size: 50.0,
                          ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const City_Screen();
                          }),
                        ),
                      );
                      if (cityName != null) {
                        var cityNameObject = await weather.cityData(cityName);
                        setState(() {
                          updateUI(cityNameObject);
                        });
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Row(
                  children: [
                    Text(
                      " $temp°",
                      style: const TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Spartan MB",
                      ),
                    ),
                    Text(
                      cityId,
                      style: const TextStyle(
                        fontSize: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15.0,
                  left: 5.0,
                ),
                child: Text(
                  cityNameText,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 60.0,
                    fontFamily: "Spartan MB",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
