// importuri
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytown_itfest_2024/ios_widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.white,
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                // Add your callback function logic here
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
                                // Add your callback function logic here
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherWidget(5, 'Partial noros'),
                    AirQualityWidget(43, 36, 23),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EventsWidget('Timisoara'),
                    TransportationWidget('Timisoara'),
                  ],
                ),
                const SizedBox(height: 20),
                Center(child: NewsLargeWidget('Accident pe DN1', "Un accident a avut loc pe DN1, in apropierea localitatii...")),
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
    );
  }
}