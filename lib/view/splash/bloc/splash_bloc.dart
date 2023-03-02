import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/core/data/prefs/app_shared_prefs.dart';
import 'package:mobile_banking/view/splash/bloc/splash_state.dart';

import 'splash_events.dart';

class SplashScreenBloc extends Bloc<SplashEvents, SplashScreenState> {
  final AppSharedPrefs sharedPrefs;

  SplashScreenBloc(this.sharedPrefs) : super(const SplashScreenState(SplashScreenEnum.calm)) {
    on<NavigateToScreen>(
      (event, emit) async{
        if (sharedPrefs.getIsVerify()) {
          emit(state.copyWith(SplashScreenEnum.main));
        } else {
          emit(state.copyWith(SplashScreenEnum.login));
        }
      },
    );
  }
}
