// importuri
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytown_itfest_2024/ios_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mytown_itfest_2024/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';

class HomePage extends StatefulWidget {

  final appRes;
  const HomePage({super.key, this.appRes});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _selectedOption;
  Weather? _weather;
  final List<String> _options = ['Timisoara', 'Bucharest', 'Cluj-Napoca', 'Iasi'];

  Future<void> saveUserData(String cityId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cityId', cityId);
  }

  void citySelector(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecteaza un oras:'),
          content: DropdownButton<String>(
            value: _selectedOption,
            onChanged: (String? newValue) {
              saveUserData(newValue ?? "Timisoara");
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SplashScreen(),
                ),
              );
              //Navigator.push((context), MaterialPageRoute(builder: (context) => SplashScreen()));
              /*
              setState(() {
                _selectedOption = newValue;
              });
              Navigator.of(context).pop();
              */
            },
            items: _options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.white,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // topper
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('lib/assets/MyTown_logo.png', height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey6,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                color: CupertinoColors.activeBlue,
                                icon: Icon(CupertinoIcons.location_solid),
                                onPressed: () {
                                  citySelector();
                                },
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey6,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                color: CupertinoColors.black,
                                icon: Icon(Icons.settings),
                                onPressed: () {
                                  // ...
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 30),
                  // primul rand cu widget-uri
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //WeatherWidget(_weather!.temperature.toString(), _weather!.weatherDescription ?? "-", widget.city),
                      WeatherWidget(widget.appRes[1].toString() , widget.appRes[2], widget.appRes[0]),

                      AirQualityWidget(43, 36, 23),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EventsWidget(widget.appRes[0]),
                      PlacesWidget(widget.appRes[0])
                    ],
                  ),
                  const SizedBox(height: 20),
                  TransportationWidget(widget.appRes[0]),
                  const SizedBox(height: 20),
                  //Center(child: NewsLargeWidget('Accident pe DN1', "Un accident a avut loc pe DN1, in apropierea localitatii...")),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LostFoundWidget(),
                      InformationWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}