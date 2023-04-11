
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
      color: Colors.blueGrey,
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
                  IconButton(icon: const Icon(Icons.format_underlined),
                      onPressed: (){
                        con.underline();
                      }, tooltip: 'Underline'),
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

                ],
              ),
            ),
          ),
          IconButton(onPressed: ()async{
            con.saveFile(content: con.mdText.text,filename: con.fileName.text);
            con.tabcon.index = 0;
            con.mdText.text = "";
            con.fileName.text = "";
          }, icon: Icon(Icons.save_rounded)),
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


