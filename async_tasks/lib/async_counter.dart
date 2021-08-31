void acyncCounter(List numbers) async {
  print('Start Async Counter');
  final stream = Stream.fromIterable(numbers);
  await for (final number in stream) {
    print(number);
  }
  print('Finish Async Counter');
}
