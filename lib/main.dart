// Aplicatia myTown pentru concursul itFest 2024
// Bogdan Barbu, Claudiu Spiescu, Nenciu David, David Patrik

// import-uri
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mytown_itfest_2024/homepage.dart';
import 'package:mytown_itfest_2024/placesToVisit.dart';
import 'package:mytown_itfest_2024/events.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTown',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), // deschidere splash screen pentru initalizare librarii
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // asteptare preluare oras => descidere pagina principala
  @override
  void initState() {
    super.initState();
    _initializeAppResources().then((initRes) {
      print(initRes);
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(appRes: initRes),
        ));
      });}

  Future<void> saveUserData(String cityId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cityId', cityId);
  }

  Future<int> getAqiData() async{
    const url = "https://api.waqi.info/feed/here/?token=a667f18c777d5a786ad15ea88348fe63336c8fe1";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final jD = json.decode(body);
    return jD["data"]["aqi"];
  }

  Future<List> _initializeAppResources() async {
    // verificare oras
    final prefs = await SharedPreferences.getInstance();
    var cityId = prefs.getString('cityId');
    if(cityId == null){
      saveUserData("Timisoara");
      cityId = "Timisoara";
    }
    print(cityId);

    // preluare date vreme
    Weather? _weather;

    const OPENWEATHER_API_KEY = "854190768a121f80c54f46909cca4864";
    final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

    _weather = await _wf.currentWeatherByCityName(cityId);

    // preluare date calitate aer
    int aqiData = await getAqiData();

    //

    //return [cityId, _weather?.temperature, _weather?.weatherDescription];
    return await [cityId, _weather.temperature?.celsius?.toInt(), _weather.weatherDescription, aqiData];
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.android,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'MyTown',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

  }
}