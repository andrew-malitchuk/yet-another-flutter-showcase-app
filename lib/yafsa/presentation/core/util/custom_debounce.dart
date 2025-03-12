import 'dart:async';
import 'dart:ui';

class CustomDebounce {
  // allow to choose a duration when an instance is created
  final Duration delay;
  // create a timer to measure the execution time inside the callback function in call method
  Timer? _timer;

  // constructor
  CustomDebounce({required this.delay});

  // use call to allow CustomDebounce instance acting as a function
  void call(VoidCallback callback) {
    // if already exists a timer when user types,
    // the timer must be canceled to avoid the previous callback
    _timer?.cancel();
    // when the user stops typing, the last timer created will not be canceled
    // and callback will be excecuted
    _timer = Timer(delay, callback);
  }

  dispose() {
    // timer should be dispose
    _timer?.cancel();
  }
}
