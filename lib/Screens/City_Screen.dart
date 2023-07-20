import 'package:flutter/material.dart';

// ignore: camel_case_types
class City_Screen extends StatefulWidget {
  static const String id = "City_Screen";

  const City_Screen({super.key});

  @override
  State<City_Screen> createState() => _City_ScreenState();
}

// ignore: camel_case_types
class _City_ScreenState extends State<City_Screen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/city_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.location_city,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    iconColor: Colors.white,
                    hintText: "Enter Location City",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(
                      10.0,
                      20,
                      40,
                      20,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  "Get Weather",
                  style: TextStyle(
                    fontSize: 30.0,
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
