// 1
void firstAsyncCounter(List numbers) async {
  print('Start the first Async Counter');
  final stream = Stream.fromIterable(numbers);
  await for (final number in stream) {
    print(number);
  }
  print('Finish the first Async Counter');
}

// 2
void secondAsyncCounter(List numbers) {
  print('Start the second Async Counter');
  final stream = Stream.fromIterable(numbers);
  stream.listen((number) {
    print(number);
  });
  print('Finish the second Async Counter');
}
