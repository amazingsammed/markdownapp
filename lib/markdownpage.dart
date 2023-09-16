import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:markdownapp/controllers/functions.dart';

import 'controllers/main_controller.dart';
import 'mother.dart';

class MarkdownDetailPage extends StatelessWidget {
  final File file;
  AppCon provider= Get.put(AppCon());

  MarkdownDetailPage({required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.path.split('/').last.replaceAll('.md', '')),
        actions: [
          IconButton(
              onPressed: () {
                provider.editFile(file);
                Get.back(closeOverlays: true);
                Get.to(()=>MotherPage());
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: FutureBuilder<String>(
        future: file.readAsString(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Markdown(
                styleSheet: provider.sheet,
                data: snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MarkdownPage extends StatelessWidget {
  AppCon con = Get.put(AppCon());
  final String data ;
  final String title;

  MarkdownPage({required this.data,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: TabBar(
            tabs: [
          Tab(text: 'Raw',),
          Tab(text: 'Preview',)
        ],controller: con.tabcon2,),
      ),
      body: TabBarView(controller: con.tabcon2,children: [
        SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
              child: Text(data)),
        ),
        Markdown(
          styleSheet: con.sheet,
            data: data)
      ],
      )

    );
  }
}