// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz_app/custom_widget/customcard_widget.dart';
import 'package:quiz_app/data/list_data.dart';
import 'package:quiz_app/utils/colors.dart';

// ignore: camel_case_types
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}
// ignore: camel_case_types
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.prymeryColor,
          title: const Text(
            "Programming Quiz",
            style: TextStyle(
              fontFamily: "Quando",
              color: Colors.white
            ),
          ),
        ),
        body: AnimationLimiter(
          child: ListView.builder(
            itemCount: Datas.images.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(seconds: 1),
                child:  SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Customcard(context: context, langname: Datas.langname[index], image: Datas.images[index], des: Datas.des[index], color: colorsList[index],),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}