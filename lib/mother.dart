import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdownapp/controllers/functions.dart';
import 'package:markdownapp/preview.dart';

import 'controllers/main_controller.dart';
import 'create.dart';


class MotherPage extends StatelessWidget {
   final AppCon con = Get.put(AppCon());
   MotherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Creator Page'),
        elevation: 0,
        actions: [
          IconButton(onPressed: ()async{
            showDialog(
              context: context,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: const Text('Enter file name:'),
                  content: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter File Name here',
                        suffix: Text('.md')),
                    controller: con.fileName,
                  ),
                  actions: <Widget>[
                    InkWell(
                      onTap: (){
                          con.fileName.text =='New File ${DateTime.now().toString()}';
                          con.saveFile(content: con.mdText.text,filename: con.fileName.text);
                          Get.back(closeOverlays: true);
                          Get.back();
                          con.tabcon.index = 0;
                          con.mdText.text = "";
                          con.fileName.text = "";
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
            //   title: "Enter file Name below",
            //     content: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //           height: 20,
            //           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            //           child: TextField(
            //
            //             decoration: InputDecoration(
            //
            //                 hintText: 'Enter File Name here',
            //             suffix: Text('.md')),
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
            //                 con.saveFile(content: con.mdText.text,filename: con.fileName.text);
            //                 Get.back(closeOverlays: true);
            //                 con.tabcon.index = 0;
            //                 con.mdText.text = "";
            //                 con.fileName.text = "";
            //
            //                 }
            //               },
            //               child: Container(
            //                 alignment: Alignment.center,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(12),
            //                     border: Border.all(color: con.fileName.text ==''? Colors.black12:Colors.black)
            //                   ),
            //                   width: 100,
            //                   height: 40,
            //                   child: Text('Save',style: TextStyle(),)),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ));
            // con.saveFile(content: con.mdText.text,filename: con.fileName.text);
            // con.tabcon.index = 0;
            // con.mdText.text = "";
            // con.fileName.text = "";
          }, icon: Icon(Icons.save_rounded)),
        ],
        bottom: TabBar(
          controller: con.tabcon,
          tabs: const [

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
          CreatePage(),
          PreviewPage()
        ],
      ),
    );
  }
}
