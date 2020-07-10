import 'dart:async';
import 'dart:collection';

import 'file.dart';
import 'ui/homeScreen.dart';

HomeScreen homeScreen;
StreamController queueChange;
List<File> files = [];
Queue<File> queueOfFiles = Queue();
int counter = 0;
Function callbackStateFirst;
Function callbackStateSecond;
int howScreen = 1;
