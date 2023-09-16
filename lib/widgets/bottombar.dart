
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:markdownapp/controllers/functions.dart';
import 'package:markdownapp/controllers/main_controller.dart';

class BottomBar extends StatelessWidget {
  AppCon con = Get.find();
  BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconButton(icon: const Icon(Icons.format_bold),
                      onPressed: (){
                    con.bold();
                      }, tooltip: 'Bold'),
                  // IconButton(icon: const Icon(Icons.format_underlined),
                  //     onPressed: (){
                  //       con.underline();
                  //     }, tooltip: 'Underline'),
                  IconButton(icon: const Icon(Icons.format_italic),
                      onPressed: (){
                    con.italic();
                      }, tooltip: 'Italic'),
                  IconButton(
                    icon: const Icon(Icons.format_strikethrough),
                    onPressed: (){
                      con.strikethrough();
                    },
                    tooltip: 'Strikethrough',
                  ),
                  IconButton(
                    icon: const Icon(Icons.h_mobiledata),
                    onPressed: (){
                      con.h1();
                    },
                    tooltip: 'Heading 1',
                  ),

                  IconButton(
                    icon: const Icon(Icons.list_outlined),
                    onPressed: (){
                      con.list();
                    },
                    tooltip: 'List',
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_quote_rounded),
                    onPressed: (){
                      con.qoute();
                    },
                    tooltip: 'Quote',
                  ),
                  IconButton(
                    icon: const Icon(Icons.image_outlined),
                    onPressed: (){
                      con.imageitem();
                    },
                    tooltip: 'Image',
                  ),
                  IconButton(
                    icon: const Icon(Icons.horizontal_split),
                    onPressed: (){
                      con.horizontalLine();
                    },
                    tooltip: 'Split',
                  ),
                  IconButton(
                    icon: const Icon(Icons.code),
                    onPressed: (){
                      con.code();
                    },
                    tooltip: 'Code',
                  ),

                ],
              ),
            ),
          ),
          // IconButton(onPressed: ()async{
          //   showDialog(
          //     context: context,
          //     // false = user must tap button, true = tap outside dialog
          //     builder: (BuildContext dialogContext) {
          //       return AlertDialog(
          //         title: Text('Enter file name:'),
          //         content: TextField(
          //           decoration: InputDecoration(
          //               border: OutlineInputBorder(),
          //               hintText: 'Enter File Name here',
          //               suffix: Text('.md')),
          //           style: TextStyle(),
          //           controller: con.fileName,
          //         ),
          //         actions: <Widget>[
          //           InkWell(
          //             onTap: (){
          //               if(con.fileName.text ==''){
          //
          //               }else{
          //                 con.saveFile(content: con.mdText.text,filename: con.fileName.text);
          //                 Get.back(closeOverlays: true);
          //                 con.tabcon.index = 0;
          //                 con.mdText.text = "";
          //                 con.fileName.text = "";
          //
          //               }
          //             },
          //             child: Container(
          //                 alignment: Alignment.center,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(12),
          //                     border: Border.all(color: con.fileName.text ==''? Colors.black12:Colors.black)
          //                 ),
          //                 width: 90,
          //                 height: 40,
          //                 child: Text('Save',style: TextStyle(),)),
          //           ),
          //         ],
          //       );
          //     },
          //   );
          //   // Get.defaultDialog(
          //   //   title: "Enter file Name below",
          //   //     content: Column(
          //   //       mainAxisAlignment: MainAxisAlignment.center,
          //   //       children: [
          //   //         Container(
          //   //           height: 20,
          //   //           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          //   //           child: TextField(
          //   //
          //   //             decoration: InputDecoration(
          //   //
          //   //                 hintText: 'Enter File Name here',
          //   //             suffix: Text('.md')),
          //   //             style: TextStyle(),
          //   //             controller: con.fileName,
          //   //           ),
          //   //         ),
          //   //         Row(
          //   //           children: [
          //   //             Spacer(),
          //   //             InkWell(
          //   //               onTap: (){
          //   //                 if(con.fileName.text ==''){
          //   //
          //   //                 }else{
          //   //                 con.saveFile(content: con.mdText.text,filename: con.fileName.text);
          //   //                 Get.back(closeOverlays: true);
          //   //                 con.tabcon.index = 0;
          //   //                 con.mdText.text = "";
          //   //                 con.fileName.text = "";
          //   //
          //   //                 }
          //   //               },
          //   //               child: Container(
          //   //                 alignment: Alignment.center,
          //   //                   decoration: BoxDecoration(
          //   //                     borderRadius: BorderRadius.circular(12),
          //   //                     border: Border.all(color: con.fileName.text ==''? Colors.black12:Colors.black)
          //   //                   ),
          //   //                   width: 100,
          //   //                   height: 40,
          //   //                   child: Text('Save',style: TextStyle(),)),
          //   //             ),
          //   //           ],
          //   //         ),
          //   //       ],
          //   //     ));
          //   // con.saveFile(content: con.mdText.text,filename: con.fileName.text);
          //   // con.tabcon.index = 0;
          //   // con.mdText.text = "";
          //   // con.fileName.text = "";
          // }, icon: Icon(Icons.save_rounded)),
          // IconButton(onPressed: (){
          //   Get.defaultDialog(title: '',content: Column(
          //     children: [
          //       InkWell(
          //           child: Text('Save '),
          //         onTap: (){
          //
          //
          //         },
          //       ),
          //
          //     ],
          //   ));
          // }, icon: Icon(Icons.menu))
        ],
      ),
    );
  }
}


