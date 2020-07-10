import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'constants.dart';

enum fileStatus { waiting, uploading, uploaded }

class File {
  String fileName;
  fileStatus status;
  int id;
  int time;

  File(this.id, this.status, this.time) {
    fileName = 'Файл ' + id.toString();
  }

  void startTimer() {
    print(status.toString() + fileStatus.uploading.toString());
    if (status == fileStatus.uploading) {
      print('Таймер пошел');
      Timer(Duration(seconds: time), () {
        status = fileStatus.uploaded;
        queueOfFiles.remove(this);
        editQueue();
        if (howScreen == 1) {
          callbackStateFirst();
        } else {
          callbackStateSecond();
        }
      });
    }
  }
}

addFile() {
  Random rnd = Random();
  int time = rnd.nextInt(5) + 1;
  File file = File(counter, fileStatus.waiting, time);
  files.add(file);
  queueOfFiles.add(file);
  editQueue();
  counter += 1;
  print(files.length);
}

removeFile(File file) {
  files.remove(file);
  queueOfFiles.remove(file);
  editQueue();
}

reset() {
  files = [];
  counter = 0;
  queueOfFiles = Queue();
}

editQueue() {
  for (int i = 0; i < queueOfFiles.length && i < 3; i++) {
    print(queueOfFiles.length);
    File file = queueOfFiles.elementAt(i);
    print(file.fileName);
    if (file.status == fileStatus.waiting) {
      file.status = fileStatus.uploading;
      file.startTimer();
    }
  }
}
