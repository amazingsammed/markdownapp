

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:markdownapp/controllers/main_controller.dart';
import 'package:markdownapp/create.dart';
import 'package:markdownapp/filelist.dart';
import 'package:markdownapp/preview.dart';

import 'markdownpage.dart';


class Home extends StatelessWidget {
  AppCon con = Get.put(AppCon());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MarkDown Helper'),
        actions: [
          IconButton(onPressed: ()async{
            String helptext= await con.getHelpFile();
            Get.to(()=>MarkdownPage(data: helptext, title: "Markdown Sample",));
          }, icon: Icon(Icons.help_outline))
        ],
        bottom: TabBar(
          controller: con.tabcon,
          tabs: [
            Tab(
              // text: 'home',
              icon: Icon(Icons.home_max),
            ),
            Tab(
             // text: 'create',
              icon: Icon(Icons.home_mini),
            ),
            Tab(
              //text: 'preview',
              icon: Icon(Icons.preview),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: con.tabcon,
        children: [
          FileList(),
          CreatePage(),
          PreviewPage()
        ],
      ),
    );
  }
}
