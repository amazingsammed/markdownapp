import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controllers/main_controller.dart';

class MarkdownDetailPage extends StatelessWidget {
  final File file;

  MarkdownDetailPage({required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.path.split('/').last),
      ),
      body: FutureBuilder<String>(
        future: file.readAsString(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Markdown(data: snapshot.data!);
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
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            child: Text(data)),
        Markdown(data: data)
      ],
      )

    );
  }
}