

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:markdownapp/models/popmenu.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'functions.dart';

class AppCon extends GetxController with GetTickerProviderStateMixin{
  TextEditingController mdText =TextEditingController();
  final _markdownFiles = <File>[].obs;
  late TabController tabcon;
  late TabController tabcon2;

  TextEditingController fileName =   TextEditingController();





  void onInit(){
    tabcon = TabController(length: 3, vsync: this);
    tabcon2 = TabController(length: 2, vsync: this);
    getMarkdownFiles();
    super.onInit();
  }


  void bold() => wrap(left: '**');
  void underline()=> wrap(left: "<u>",right: "</u>");
  void italic() => wrap(left: '*');
  void strikethrough() => wrap(left: '~~');
  void mathText() => wrap(left: '\$');
  void h1()=> wrap(left: "\n# ",right: "\n");
  void h2()=> wrap(left: "## ",right: "\n");
  void h3()=> wrap(left: "### ",right: "\n");
  void h4()=> wrap(left: "#### ",right: "\n");
  void h5()=> wrap(left: "##### ",right: "\n");




  List<File> get markdownFiles => _markdownFiles.value;



  Future<void> getMarkdownFiles() async {
    final status = await Permission.storage.request();
    final directory = await getExternalStorageDirectory();
    print(status);


   //  final directory = Directory('/storage/self/primary/');
     _searchForMarkdownFiles(directory!);
  }

  void _searchForMarkdownFiles(Directory dir) {
    final files = dir.listSync();
    _markdownFiles.clear();
    for (final file in files) {
      if (file is Directory) {
        _searchForMarkdownFiles(file);
      } else if (file is File && file.path.endsWith('.md')) {
        _markdownFiles.add(file);
      }
    }
  }

  Future<String> getHelpFile() async {
    String textasset = "assets/files/sample.md"; //path to text file asset
    String text = await rootBundle.loadString(textasset);
    return text;
  }

  void shareFile(File file) {
    print(file.path);
    List<String> paths = [file.path];
    Share.shareFiles(paths, text: 'Check out this markdown file!');
  }


}