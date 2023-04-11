

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:markdownapp/controllers/main_controller.dart';
import 'package:path_provider/path_provider.dart';

extension Functions on AppCon{
  void wrap({
    required String left,
    String? right,
  }) {
    final ctl = mdText;
    if (ctl == null) return;
    right ??= left;
    final sel = ctl.selection;
    final text = ctl.text;
    final output = [sel.textBefore(text), left, sel.textInside(text), right, sel.textAfter(text)].join();
    ctl.value = TextEditingValue(
      text: output,
      selection: sel.copyWith(
        baseOffset: sel.baseOffset + left.length,
        extentOffset: sel.extentOffset + left.length,
      ),
    );
  }


  void saveFile({ required String filename,required String content})async{
    String fname = filename.trim().isEmpty ? "Untitled":filename.trim();
    final directory = await getExternalStorageDirectory();
    String filePath = "${directory?.path}/$fname.md";

    File file = File(filePath);
    file.writeAsString(content);
    getMarkdownFiles();
  }

  Future<void> editFile(File file) async {
    String filename = file.path.split('/').last.replaceAll('.md', '');
    String content = await file.readAsString();
    fileName.text = filename;
    mdText.text = content;
    tabcon.index = 1;
  }

  Future<void> deleteFile(File file) async {
    await file.delete();
    getMarkdownFiles();
  }
}