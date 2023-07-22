import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:markdownapp/controllers/main_controller.dart';

class Settings extends StatelessWidget {
  AppCon provider = Get.put(AppCon());

  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text('Color',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple),),
            ),

            Obx(() {
              return InkWell(
                onTap: () async {
                  Color pickerColor = provider.h1Color.value;
                  provider.h1Color.value =
                  await Get.to(() => ChangeColor(pickerColor: pickerColor));
                },
                child: ListTile(
                  title: Text('H1 Color'),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: provider.h1Color.value,
                    ),),
                ),
              );
            }),
            Obx(() {
              return InkWell(
                onTap: () async {
                  Color pickerColor = provider.h2Color.value;
                  provider.h2Color.value =
                  await Get.to(() => ChangeColor(pickerColor: pickerColor));
                },
                child: ListTile(
                  title: Text('H2 Color'),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: provider.h2Color.value,
                    ),),
                ),
              );
            }),
            Obx(() {
              return InkWell(
                onTap: () async {
                  Color pickerColor = provider.h3Color.value;
                  provider.h3Color.value =
                  await Get.to(() => ChangeColor(pickerColor: pickerColor));
                },
                child: ListTile(
                  title: Text('H3 Color'),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: provider.h3Color.value,
                    ),),
                ),
              );
            }),
            Obx(() {
              return InkWell(
                onTap: () async {
                  Color pickerColor = provider.h4Color.value;
                  provider.h4Color.value =
                  await Get.to(() => ChangeColor(pickerColor: pickerColor));
                },
                child: ListTile(
                  title: Text('H4 Color'),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: provider.h4Color.value,
                    ),),
                ),
              );
            }),
            Obx(() {
              return InkWell(
                onTap: () async {
                  Color pickerColor = provider.h5Color.value;
                  provider.h5Color.value =
                  await Get.to(() => ChangeColor(pickerColor: pickerColor));
                },
                child: ListTile(
                  title: Text('H5 Color'),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: provider.h5Color.value,
                    ),),
                ),
              );
            }),
            //BlockPicker(pickerColor: pickerColor, onColorChanged: (val){})
          ],
        ),
      ),
    );
  }
}

class ChangeColor extends StatelessWidget {
  Color pickerColor;

  ChangeColor({Key? key, required this.pickerColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Color'),
      ),
      body: BlockPicker(pickerColor: pickerColor, onColorChanged: (val) {
        color = val;
        print(color);
      }),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.back(result: color);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12.0)
          ),
          child: Text('Done', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}


// Future<Color> changeColor(Color pickerColor) async {
//   Color color = Colors.red;
//   Get.defaultDialog(
//     onConfirm: (){
//
//     },
//       textConfirm: 'Done',
//       title: 'Select your color',
//       content:
//
//
//
// return await pickerColor;
// }
