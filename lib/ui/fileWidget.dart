import 'package:flutter/material.dart';
import 'package:loading_files_test/file.dart';

// ignore: must_be_immutable
class FileWidget extends StatefulWidget {
  @override
  _FileWidgetState createState() => _FileWidgetState();

  FileWidget(this.callback, this.file);

  Function callback;
  File file;
}

class _FileWidgetState extends State<FileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.file.fileName),
      subtitle: widget.file.status == fileStatus.waiting
          ? Text('В ожидании')
          : Container(
              child: widget.file.status == fileStatus.uploading
                  ? Text('Загружается')
                  : Container(),
            ),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          removeFile(widget.file);
        },
      ),
    );
  }
}
