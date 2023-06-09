import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:markdownapp/controllers/functions.dart';
import 'package:markdownapp/controllers/main_controller.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'markdownpage.dart';

class FileList extends StatelessWidget {
  AppCon con = Get.put(AppCon());
  FileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if(con.markdownFiles.length == 0)
          return Center(
          child: Text('No file available'),
        );
        return ListView.separated(
            itemCount: con.markdownFiles.length,
            itemBuilder: (BuildContext context, int index) {
              final file = con.markdownFiles[index];
              final fileName = file.path.split('/').last;
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white54,
                  child: Text('MD'),
                ),
                title: Text(fileName.replaceAll('.md', '')),
                onTap: () {
                  Get.to(() => MarkdownDetailPage(file: file));
                },
                onLongPress: () {
                  Get.defaultDialog(
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                              width: Get.width/1.6,
                              child: InkWell(
                                  onTap: () {
                                    con.editFile(file);
                                    Get.back(closeOverlays: true);
                                  },
                                  child: Card(child: ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('Edit'),)))),
                          SizedBox(
                              width: Get.width/1.6,
                              child: InkWell(
                                  onTap: () {
                                    con.deleteFile(file);
                                    Get.back(closeOverlays: true);
                                  },
                                  child: Card(child: ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete'),)))),
                          SizedBox(
                              width: Get.width/1.6,
                              child: InkWell(
                                  onTap: () {
                                    con.shareFile(file);
                                    Get.back(closeOverlays: true);
                                  },
                                  child: Card(child: ListTile(
                                    leading: Icon(Icons.send_rounded),
                                    title: Text('Share File'),)))),
                        ],
                      ));
                },
              );
            }, separatorBuilder: (BuildContext context, int index)=>const Divider(height: 2.0,),
          );
      }),
    );
  }
}


