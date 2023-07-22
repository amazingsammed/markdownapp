

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
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

    var h1Color = Colors.black.obs;
  var h2Color = Colors.black.obs;
  var h3Color = Colors.black.obs;
  var h4Color = Colors.black.obs;
  var h5Color = Colors.black.obs;









  @override
  void onInit(){

    tabcon = TabController(length: 3, vsync: this);
    tabcon2 = TabController(length: 2, vsync: this);
    firstFile();
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

  void list()=> wrap(left: "* ",right: "\n");
  void code()=> wrap(left: "```",right: "```");
  void qoute()=> wrap(left: "> ",right: "\n");
  void horizontalLine()=> wrap(left: "----- ",right: "\n");
  void imageitem()=> wrap(left: "![",right: "]()");




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


  firstFile() async {
    Directory? documentsDirectory = await getExternalStorageDirectory();
    String path = join(documentsDirectory?.path as String, "sample.md");
    bool dbExists = await File(path).exists();
    if (!dbExists) {
      ByteData data = await rootBundle.load("assets/files/sample.md");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      getMarkdownFiles();
    }
  }

  Future<void> openExternalFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['md', 'txt'],
    );

    if (result != null) {
      File file = File(result.files.single.path.toString());
      String abc = await file.readAsString();
      if(mdText.text.isEmpty == false) saveCurrentData();
      mdText.text = abc;
      tabcon.index = 1;
    } else {

    }
  }

 void saveCurrentData(){
     saveFile(filename: 'Unsaved file ${DateTime.now()}', content: mdText.text);
  }





  //
  MarkdownStyleSheet get sheet => MarkdownStyleSheet(

  h1: TextStyle(color: h1Color.value),
    h2: TextStyle(color: h2Color.value),
    h3: TextStyle(color: h3Color.value),
    h4: TextStyle(color: h4Color.value),
    h5: TextStyle(color: h5Color.value),


  );


}