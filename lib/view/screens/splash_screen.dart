import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_task/core/helper/colors.dart';
import 'package:movie_task/view/screens/home_screen.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoNext();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.white,
          body: Center(
            child: Container(
              height: media.height * 0.3,
              width:  media.width * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/popcorn.png'),
                ),
              ),
            ),
          ),
        );
  }

  gotoNext() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));
    }
    );
  }
}