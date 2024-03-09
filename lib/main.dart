
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytown_itfest_2024/homepage.dart';
import 'package:mytown_itfest_2024/placesToVisit.dart';
import 'package:mytown_itfest_2024/events.dart';
import 'package:weather/weather.dart';

void main() {
  runApp(const MyTown());
}

class MyTown extends StatelessWidget {
  const MyTown({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget page = SplashScreenController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTown',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: page
    );
  }
 }

 class SplashScreenController extends StatefulWidget {
  @override
  _SplashScreenControllerState createState() => _SplashScreenControllerState();
}

class _SplashScreenControllerState extends State<SplashScreenController> {
  bool _showSplash = true;
  var cityId;
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    // Simulate some async initialization tasks here
    initializeApp().then((_) {
      setState(() {
        _showSplash = false; // Hide the splash screen
      });
    });
  }

  Future<void> saveUserData(int cityId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cityId', cityId.toString());
  }

  Future<void> initializeApp() async {
    // check city
    final prefs = await SharedPreferences.getInstance();
    cityId = prefs.getString('cityId');
    if(cityId == null){
      saveUserData(0);
      cityId = "Timisoara";
    }
    // get weather
    const OPENWEATHER_API_KEY="854190768a121f80c54f46909cca4864";
    final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
    _wf.currentWeatherByCityName(cityId).then((w) 
    {
      setState((){
        _weather = w;
      });
    });
    // get air quality


    // get events
    // -
    // get landmarks
    // -
    // get transportation data

    // get local news

    // get crucial info

    // Simulate initialization tasks
    await Future.delayed(Duration(seconds: 1)); // Simulating initialization tasks with a delay
  }

  @override
  Widget build(BuildContext context) {
    return _showSplash ? SplashScreen() : HomePage(selectedCity: cityId, weather: _weather,);
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your custom splash screen design
    return const Scaffold(
      backgroundColor: Colors.blue, // Background color of the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen content (e.g., logo, app name, etc.)
            Icon(
              Icons.android,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'My Flutter App',
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
