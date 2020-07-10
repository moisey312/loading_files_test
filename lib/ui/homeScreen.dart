import 'package:flutter/material.dart';
import 'package:loading_files_test/file.dart';
import 'package:loading_files_test/ui/filesScreen.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void callback() {
    setState(() {});
  }

  @override
  void initState() {
    callbackStateFirst = this.callback;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HomePage')),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Text('Файлы'),
                    subtitle: files.length == 0
                        ? Text('Нет файлов')
                        : Text(queueOfFiles.length == 0
                            ? 'Кол-во файлов: ' + files.length.toString()
                            : 'Осталось загрузить: ' +
                                queueOfFiles.length.toString() +
                                ' Всего файлов: ' +
                                files.length.toString()),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new FilesScreen()))
                          .then((value) {
                        setState(() {});
                      });
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text('Сбросить'),
                  onPressed: files.length == 0
                      ? null
                      : () {
                          setState(() {
                            reset();
                          });
                        },
                ),
                FlatButton(
                  child: Text('Сохранить'),
                  onPressed: files.length == 0
                      ? null
                      : () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Файлы сохранены"),
                            duration: Duration(seconds: 2),
                          ));
                        },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
