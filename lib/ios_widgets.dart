// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytown_itfest_2024/placesToVisit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'events.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget(this.temperatureInt, this.description, this.city, {super.key});

  String temperatureInt;
  String description;
  String city;

  @override
  Widget build(BuildContext context) {
    String temperature = temperatureInt;
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
    
      },
      child: Container(
        width: 175,
        height: 175,
        decoration: BoxDecoration(
          color: CupertinoColors.activeBlue,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city,
                style: TextStyle(
                  height: 0.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              Text('$temperature\u00b0',
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 50,
                  fontWeight: FontWeight.w100,
                  color: CupertinoColors.white,
                ),),
              const SizedBox(height: 10),
              const Icon(CupertinoIcons.cloud_sun_fill, color: CupertinoColors.white, size: 27,),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  description,
                  style: const TextStyle(
                    height: 0.5,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
              ]
          ),
        ),
      ),
    );
  }
}

class AirQualityWidget extends StatelessWidget {
  AirQualityWidget(this.pm10Int, this.pm25Int, this.pm1Int, {super.key});

  int pm10Int;
  int pm25Int;
  int pm1Int;

  @override
  Widget build(BuildContext context) {
    String pm10 = pm10Int.toString();
    String pm25 = pm25Int.toString();
    String pm1 = pm1Int.toString();
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
          
      },
      child: Container(
        width: 175,
        height: 175,
        decoration: BoxDecoration(
          color: CupertinoColors.activeGreen,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Calitate aer',
                style: TextStyle(
                  height: 0.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 3),
              const Text('20',
                style: TextStyle(
                  height: 1.3,
                  fontSize: 40,
                  fontWeight: FontWeight.w100,
                  color: CupertinoColors.white,
                ),),
              const SizedBox(height: 7),
              // PM10
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PM10',
                    style: TextStyle(
                      height: 0.5,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                  Text('$pm10 \u00b5g/m\u00b3',
                  style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),),
                ],
              ),
              // PM 2.5
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PM2.5',
                    style: TextStyle(
                      height: 0.5,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                  Text('$pm25 \u00b5g/m\u00b3',
                  style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),),
                ],
              ),
              // PM 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PM1',
                    style: TextStyle(
                      height: 0.5,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                  Text('$pm1 \u00b5g/m\u00b3',
                  style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),),
                ],
              ),
              ]
          ),
        ),
      ),
    );
  }
}

class EventsWidget extends StatelessWidget {
  EventsWidget(this.selectedTown, {super.key});

  String selectedTown;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.push((context), MaterialPageRoute(builder: (context) => Events(city: selectedTown)));
      },
      child: Container(
        width: 175,
        height: 175,
        decoration: BoxDecoration(
          color: CupertinoColors.activeOrange,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text(
                    'Evenimente',
                    style: TextStyle(
                      height: 0.5,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('in $selectedTown',
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text('Vezi\nmai multe detalii',
                        style: TextStyle(
                          height: 1.1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.white,
                        ),),
                    ),
                    Icon(CupertinoIcons.calendar, color: CupertinoColors.white, size: 33,),
                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}

class PlacesWidget extends StatelessWidget {
  PlacesWidget(this.selectedTown, {super.key});

  String selectedTown;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.push((context), MaterialPageRoute(builder: (context) => PlacesToVisit(city: selectedTown)));
      },
      child: Container(
        width: 175,
        height: 175,
        decoration: BoxDecoration(
          color: CupertinoColors.activeOrange,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text(
                    'Locuri de vizitat',
                    style: TextStyle(
                      height: 0.5,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('in $selectedTown',
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text('Vezi\nmai multe detalii',
                        style: TextStyle(
                          height: 1.1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.white,
                        ),),
                    ),
                    Icon(CupertinoIcons.placemark, color: CupertinoColors.white, size: 33,),
                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}

class TransportationWidget extends StatelessWidget {
  final String selectedTown;

  TransportationWidget(this.selectedTown, {super.key});

  void _launchMoovitApp() async {
    const String moovitScheme = 'moovit://nearby?lat=&lon=&partner_id=';
    const String moovitUrl = 'http://app.appsflyer.com/com.tranzmate?pid=DL&c=';

    try {
      // Attempt to launch Moovit app
      await launch(moovitScheme);
    } catch (e) {
      // Moovit not installed - send to store
      await launch(moovitUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        _launchMoovitApp();
      },
      child: Container(
        width: 360,
        height: 175,
        decoration: BoxDecoration(
          color: CupertinoColors.systemPurple,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transport\nin comun',
                style: TextStyle(
                  height: 1.1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                      child: Text(
                        'Rute,\norare\nși stații',
                        style: TextStyle(
                          height: 1.1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  Icon(CupertinoIcons.bus, color: CupertinoColors.white, size: 33,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LostFoundWidget extends StatelessWidget {
  const LostFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
          
      },
      child: Container(
        width: 175,
        height: 175,
        decoration: BoxDecoration(
          color: CupertinoColors.systemRed,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                  'Obiecte pierdute',
                  style: TextStyle(
                    height: 1.1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  child: Text('Gaseste\nsau anunta un obiect pierdut',
                    style: TextStyle(
                      height: 1.1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),),
                ),
            ],
          ),
      )),
    );
  }
}

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
          
      },
      child: Container(
        width: 175,
        height: 175,
        decoration: BoxDecoration(
          color: CupertinoColors.darkBackgroundGray,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                  'Informatii',
                  style: TextStyle(
                    height: 1.1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  child: Text('Institutii publice, spitale, sectii de politie',
                    style: TextStyle(
                      height: 1.1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),),
                ),
            ],
          ),
      )),
    );
  }
}