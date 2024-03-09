import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mytown_itfest_2024/foundSearchForm.dart';
import 'package:mytown_itfest_2024/notFoundPage.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class LoadingSearchPage extends StatefulWidget {
  @override
  _LoadingSearchPageState createState() => _LoadingSearchPageState();
}

class _LoadingSearchPageState extends State<LoadingSearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
            Duration(seconds: 10),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => notFoundPage())));
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: CupertinoColors.white,
        body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleAnimationProgressBar(
                height: 30,
                width: 300,
                backgroundColor: Colors.grey.shade800,
                foregrondColor: Colors.purple,
                ratio: 1,
                direction: Axis.horizontal,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 30),
                borderRadius: BorderRadius.circular(10),
                gradientColor: const LinearGradient(
                colors: [Colors.pink, Colors.purple]),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.pink,
                    offset: Offset(
            5.0,
            5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                  ],
            ),]
          )
        ),
      ),
    );
  }
}