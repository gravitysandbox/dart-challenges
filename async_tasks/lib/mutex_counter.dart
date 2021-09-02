import 'dart:async';
import 'dart:math';

import 'package:mutex/mutex.dart';

final _random = Random();
const _maxDelay = 500;
Mutex mutex = Mutex();

Future<void> randomDelay() async {
  await Future<void>.delayed(
      Duration(microseconds: _random.nextInt(_maxDelay)));
}

Future<void> mutexCounter(List numbers) async {
  print('Start Mutex Counter');
  await randomDelay();
  await mutex.protect(() async {
    final stream = Stream.fromIterable(numbers);
    stream.listen((number) {
      print(number);
    });
  });
  print('Finish Mutex Counter');
}
