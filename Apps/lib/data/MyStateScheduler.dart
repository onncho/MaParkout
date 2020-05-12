import 'package:flutter/cupertino.dart';

class MyStateScheduler with ChangeNotifier {
  double _stateManamentTime = 0.5;
  double get stateManagmentTime => _stateManamentTime;

  set stateManagmentTime(double newValue) {
    _stateManamentTime = newValue;
    notifyListeners();
  }

  bool _isSplashOpen = true;
  bool get isSplahOpen => _isSplashOpen;

  set isSplashOpen(bool newValue) {
    _isSplashOpen = newValue;
    notifyListeners();
  }

  hideSplash() {
    isSplashOpen = false;
  }
}
