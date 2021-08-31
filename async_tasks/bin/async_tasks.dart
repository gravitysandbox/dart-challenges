import 'package:async_tasks/isolate.dart';
import 'package:async_tasks/async_counter.dart';
import 'package:async_tasks/mutex_counter.dart';

void main(List<String> arguments) async {
  final numbers = [1, 2, 3, 4, 5];
  acyncCounter(numbers);
  await mutexCounter(numbers);

  var mainToIsolateStream = await initIsolate();
  mainToIsolateStream.send('Message from main()');
}
