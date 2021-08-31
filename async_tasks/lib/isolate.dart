import 'dart:async';
import 'dart:io';
import 'dart:isolate';

Future<SendPort> initIsolate() async {
  var completer = Completer<SendPort>();
  var isolateToMainStream = ReceivePort();

  isolateToMainStream.listen(
    (message) {
      if (message is SendPort) {
        var mainToIsolateStream = message;
        completer.complete(mainToIsolateStream);
      } else {
        print('[isolateToMainStream] $message');
      }
    },
  );

  var isolateInstance =
      await Isolate.spawn(isolate, isolateToMainStream.sendPort);
  return completer.future;
}

void isolate(SendPort isolateToMainStream) {
  var mainToIsolateStream = ReceivePort();
  isolateToMainStream.send(mainToIsolateStream.sendPort);

  mainToIsolateStream.listen((message) {
    print('[mainToIsolateStream] $message');
    exit(0);
  });
  isolateToMainStream.send('Message from isolate()');
  sleep(Duration(seconds: 5));
}
