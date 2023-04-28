

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:markdownapp/controllers/main_controller.dart';
import 'package:markdownapp/widgets/bottombar.dart';

class CreatePage extends StatelessWidget {
  AppCon con = Get.put(AppCon());
  CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //   height: 20,
          //   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          //   child: TextField(
          //     decoration: const InputDecoration.collapsed(hintText: 'Enter File Name here'),
          //     style: TextStyle(),
          //     controller: con.fileName,
          //   ),
          // ),
          // Divider(),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextField(
                decoration: const InputDecoration.collapsed(hintText: 'Write Markdown here ....'),
                maxLines: null,
                expands: true,
                style: TextStyle(
                  // fontFamily: 'JetBrains Mono',
                  // fontSize: ref.watch(fontSizeProvider),
                ),
                controller: con.mdText,
               // onChanged: ref.read(sourceProvider.notifier).setBuffer,
               //  inputFormatters: [
               //    NewlineFormatter(),
               //  ],
              ),
            ),
          ),
          BottomBar()
        ],
      ),
    );
  }
}