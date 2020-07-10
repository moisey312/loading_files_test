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
    queueOfFiles.add(id);
  }
}

addFile() {
  Random rnd = Random();
  int time = rnd.nextInt(5) + 1;
  files.add(File(
      counter,
      queueOfFiles.length >= 3 ? fileStatus.waiting : fileStatus.uploaded,
      time));
  counter += 1;
  print(files.length);
}

removeFile(File file) {
  files.remove(file);
}
