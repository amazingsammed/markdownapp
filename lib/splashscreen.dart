import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controllers/main_controller.dart';
import 'home.dart';

class SplashScreen extends StatelessWidget {

  SplashScreen({Key? key}) : super(key: key);


   startTime() async {
     var duration = const Duration(seconds: 2);
     return Timer(duration, navigationPage);
   }
   void navigationPage() {
     Get.offAll(() => Home());
   }

  @override
  Widget build(BuildContext context) {
    startTime();
    return Scaffold(
      body: SafeArea(
        child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Spacer(),
                Container(
                  height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/markdown_app_icon.png')
                        )
                    ),
                  ),

                SizedBox(height: 10,),
                Text('MarkDown Cheif Editor',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                Spacer(),
                Text('Developed by Sammed'),
                SizedBox(height: 25,)
              ],
            ),
          ),
      ),
    );
  }
}
