import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:markdownapp/controllers/functions.dart';
import 'package:markdownapp/controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:markdownapp/mother.dart';
import 'dart:io';

import 'markdownpage.dart';

class FileList extends StatelessWidget {
  AppCon con = Get.put(AppCon());
  FileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (con.markdownFiles.length == 0)
          return Center(
            child: Text('No file available'),
          );
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Android/data/com.trustmedia.markdownapp/files'),
            Divider(),
            Expanded(
              child: ListView.separated(
                itemCount: con.markdownFiles.length,
                itemBuilder: (BuildContext context, int index) {
                  final file = con.markdownFiles[index];
                  final fileName = file.path.split('/').last;
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
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
                                width: Get.width / 1.6,
                                child: InkWell(
                                    onTap: () {
                                      con.editFile(file);
                                      Get.back(closeOverlays: true);
                                      Get.to(() => MotherPage());
                                    },
                                    child: Card(
                                        child: ListTile(
                                      leading: Icon(Icons.edit),
                                      title: Text('Edit'),
                                    )))),
                            SizedBox(
                                width: Get.width / 1.6,
                                child: InkWell(
                                    onTap: () {
                                      con.deleteFile(file);
                                      Get.back(closeOverlays: true);
                                    },
                                    child: Card(
                                        child: ListTile(
                                      leading: Icon(Icons.delete),
                                      title: Text('Delete'),
                                    )))),
                            SizedBox(
                                width: Get.width / 1.6,
                                child: InkWell(
                                    onTap: () {
                                      con.shareFile(file);
                                      Get.back(closeOverlays: true);
                                    },
                                    child: Card(
                                        child: ListTile(
                                      leading: Icon(Icons.send_rounded),
                                      title: Text('Share File'),
                                    )))),
                          ],
                        ));
                      },
                      trailing: IconButton(
                        onPressed: () {
                          Get.bottomSheet(Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20))),
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      con.editFile(file);

                                      Get.back(closeOverlays: true);
                                      Get.to(() => MotherPage());
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.edit),
                                      title: Text('Edit'),
                                    )),
                                SizedBox(
                                    child: InkWell(
                                        onTap: () {
                                          con.deleteFile(file);
                                          Get.back(closeOverlays: true);
                                        },
                                        child: ListTile(
                                          leading: Icon(Icons.delete),
                                          title: Text('Delete'),
                                        ))),
                                SizedBox(
                                    child: InkWell(
                                        onTap: () {
                                          con.shareFile(file);
                                          Get.back(closeOverlays: true);
                                        },
                                        child: ListTile(
                                          leading: Icon(Icons.send),
                                          title: Text('Share'),
                                        ))),
                              ],
                            ),
                          ));
                        },
                        icon: Icon(Icons.more_vert),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 2.0,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
