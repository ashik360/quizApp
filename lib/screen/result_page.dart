// ignore_for_file: no_logic_in_create_state, avoid_unnecessary_containers

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/utils/colors.dart';

// ignore: camel_case_types
class resultpage extends StatefulWidget {
 final int marks;
  const resultpage({Key? key , required this.marks}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

// ignore: camel_case_types
class _resultpageState extends State<resultpage> {

  List<String> images = [
    "images/success_removebg_preview.png",
    "images/good.png",
    "images/sad.png",
  ];

late  String message;
late  String image;

  final controller = ConfettiController();
  bool isPalying = true;
  @override
  void initState(){
    controller.play();
    if(marks < 100){
      image = images[2];
      // ignore: prefer_adjacent_string_concatenation
      message = "You Should Try Hard..\n" + "You Scored $marks";
    }else if(marks < 50){
      image = images[1];
      // ignore: prefer_adjacent_string_concatenation
      message = "You Can Do Better..\n" + "You Scored $marks";
    }else{
      image = images[0];
      // ignore: prefer_adjacent_string_concatenation
      message = "You Did Very Well..\n" + "You Scored $marks";
    }
    Future.delayed(Duration(seconds: 10), () {
    // Your code
      controller.stop();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  late int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: AppColor.prymeryColor.withOpacity(0.5),
          // appBar: AppBar(
          //   title: const Text(
          //     "Result",
          //   ),
          // ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Your achievements ",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColor.whiteColor,
                    fontFamily: "Quando",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: ClipRect(
                    child: Image(
                      image: AssetImage(
                        image,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 15.0,
                  ),
                  child: Center(
                  child: Text(
                    message,
                    style:  TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 18.0,
                      fontFamily: "Quando",
                    ),
                  ),
                )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                        isPalying = false;
                        if(!isPalying){
                          controller.stop();
                        }
                      },
                      child:  Text(
                        "Close",
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  ],
                ),
                ConfettiWidget(
                  confettiController: controller,
                  shouldLoop: true,
                  blastDirectionality: BlastDirectionality.explosive,
                  emissionFrequency: 0.50,
                  numberOfParticles: 4,
                  maxBlastForce: 100,
                  minBlastForce: 10,
                  gravity: 0.8,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}