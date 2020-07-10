import 'package:flutter/material.dart';
import 'package:loading_files_test/file.dart';
import 'package:loading_files_test/ui/fileWidget.dart';

import '../constants.dart';

class FilesScreen extends StatefulWidget {
  @override
  _FilesScreenState createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  ScrollController scrollController;

  void callback() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController = ScrollController();
    callbackStateSecond = this.callback;
    howScreen = 2;
    super.initState();
  }

  @override
  void dispose() {
    howScreen = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Файлы',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: files.length == 0
          ? Center(
              child: Text('Нет файлов'),
            )
          : ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                return FileWidget(this.callback, files[index]);
              },
              reverse: false,
              controller: scrollController,
            ),
      floatingActionButton: files.length < 30
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  addFile();
                });
              },
              child: Icon(Icons.add),
            )
          : Container(),
    );
  }
}
