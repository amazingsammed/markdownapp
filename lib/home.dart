

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:markdownapp/controllers/functions.dart';
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
        title: Text('MarkDown Chief'),
        elevation: 0,
        actions: [
          // IconButton(onPressed: ()async{
          //
          // }, icon: Icon(Icons.help_outline)),
          IconButton(onPressed: ()async{
            // showDialog(context: context, builder: (builder){
            //   return Container(
            //     height: 200,
            //     child: Text('Kofi'),
            //   );
            // });
            Get.defaultDialog(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                        width: Get.width/1.6,
                        child: InkWell(
                            onTap: () {
                              con.openExternalFile();
                              Get.back(closeOverlays: true);
                            },
                            child: Card(child: ListTile(
                              leading: Icon(Icons.file_open_outlined),
                              title: Text('Open File'),)))),
                    SizedBox(
                        width: Get.width/1.6,
                        child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                // false = user must tap button, true = tap outside dialog
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    title: Text('Enter file name:'),
                                    content: Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter File Name here',
                                            suffix: Text('.md')),
                                        style: TextStyle(),
                                        controller: con.fileName,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      InkWell(
                                        onTap: (){
                                          if(con.fileName.text ==''){

                                          }else{
                                            con.saveFile(content: con.mdText.text,filename: con.fileName.text);
                                            Get.back(closeOverlays: true);
                                            con.tabcon.index = 0;
                                            con.mdText.text = "";
                                            con.fileName.text = "";

                                          }
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: con.fileName.text ==''? Colors.black12:Colors.black)
                                            ),
                                            width: 90,
                                            height: 40,
                                            child: Text('Save',style: TextStyle(),)),
                                      ),
                                    ],
                                  );
                                },
                              );

                              // Get.defaultDialog(
                              //
                              //   title: 'hello',
                              //     titlePadding: EdgeInsets.all(0),
                              //     content: Column(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Container(
                              //           height: 50,
                              //           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              //           child: TextField(
                              //
                              //             decoration: InputDecoration(
                              //               border: OutlineInputBorder(),
                              //
                              //                 hintText: 'Enter File Name here',
                              //                 suffix: Text('.md')),
                              //             style: TextStyle(),
                              //             controller: con.fileName,
                              //           ),
                              //         ),
                              //         Row(
                              //           children: [
                              //             Spacer(),
                              //             InkWell(
                              //               onTap: (){
                              //                 if(con.fileName.text ==''){
                              //
                              //                 }else{
                              //                   con.saveFile(content: con.mdText.text,filename: con.fileName.text);
                              //                   Get.back(closeOverlays: true);
                              //                   con.tabcon.index = 0;
                              //                   con.mdText.text = "";
                              //                   con.fileName.text = "";
                              //
                              //                 }
                              //               },
                              //               child: Container(
                              //                   alignment: Alignment.center,
                              //                   decoration: BoxDecoration(
                              //                       borderRadius: BorderRadius.circular(12),
                              //                       border: Border.all(color: con.fileName.text ==''? Colors.black12:Colors.black)
                              //                   ),
                              //                   width: 100,
                              //                   height: 40,
                              //                   child: Text('Save',style: TextStyle(),)),
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ));
                            },
                            child: Card(child: ListTile(
                              leading: Icon(Icons.save_rounded),
                              title: Text('Save File'),)))),
                    SizedBox(
                        width: Get.width/1.6,
                        child: InkWell(
                            onTap: () async {
                              String helptext= await con.getHelpFile();
                              Get.to(()=>MarkdownPage(data: helptext, title: "Markdown Sample",));
                            },
                            child: Card(child: ListTile(
                              leading: Icon(Icons.leaderboard_rounded),
                              title: Text('Markdown Sample'),)))),
                  ],
                ));

          }, icon: Icon(Icons.more_vert))
        ],
        bottom: TabBar(
          controller: con.tabcon,
          tabs: [
            Tab(
             // text: 'home',
              icon: Icon(Icons.list),
            ),
            Tab(
             // text: 'create',
              icon: Icon(Icons.home_max_outlined),
            ),
            Tab(
              //text: 'preview',
              icon: Icon(Icons.preview_outlined),
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
