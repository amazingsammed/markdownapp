

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:markdownapp/controllers/main_controller.dart';

class PreviewPage extends StatelessWidget {
  AppCon con = Get.put(AppCon());
  PreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Markdown(
          data: con.mdText.text,
        ),
      ),
    );
  }
}
