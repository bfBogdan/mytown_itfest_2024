// Aplicatia myTown pentru concursul itFest 2024
// Bogdan Barbu, Claudiu Spiescu, Nenciu David, David Patrik

// import-uri
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mytown_itfest_2024/homepage.dart';
import 'package:mytown_itfest_2024/placesToVisit.dart';
import 'package:mytown_itfest_2024/events.dart';
import 'package:weather/weather.dart';

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
    _initializeAppResources().then((cityName) {
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(city: cityName),
        ));
      });}

  Future<void> saveUserData(String cityId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cityId', cityId);
  }

  Future<String> _initializeAppResources() async {
    // verificare oras
    final prefs = await SharedPreferences.getInstance();
    var cityId = prefs.getString('cityId');
    if(cityId == null){
      saveUserData("Timisoara");
      cityId = "Timisoara";
    }
    print(cityId);

    return cityId;
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