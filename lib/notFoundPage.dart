import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mytown_itfest_2024/foundSearchForm.dart';
import 'package:mytown_itfest_2024/main.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class notFoundPage extends StatefulWidget {
  @override
  _notFoundPageState createState() => _notFoundPageState();
}

class _notFoundPageState extends State<notFoundPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope( 
      canPop: false,
      child: Scaffold(
        backgroundColor: CupertinoColors.white,
        body: Center(
          child:  Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/assets/dinpacate.png',
                height: 250,),
                const SizedBox(height: 20),
                const Text('Din pacate nu am gasit niciun obiect asemanator in baza noastra de date.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                
                ),
                const SizedBox(height: 75),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'MyTown',)));
                  }, 
                  child: const Text('Inapoi la pagina principala',)
                )
                ]
            ),
          )
        ),
      ),
    );
  }
}