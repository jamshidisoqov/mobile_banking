import 'package:flutter/foundation.dart';

@immutable
class SplashScreenState {
  final SplashScreenEnum? screenEnum;

  const SplashScreenState(this.screenEnum);

  SplashScreenState copyWith(SplashScreenEnum? screenEnum) {
    return SplashScreenState(screenEnum ?? this.screenEnum);
  }
}

enum SplashScreenEnum { main, login, calm }
