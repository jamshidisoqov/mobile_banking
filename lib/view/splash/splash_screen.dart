import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/di/database_module.dart';
import 'package:mobile_banking/view/login/login_screen.dart';
import 'package:mobile_banking/view/main/main_screen.dart';
import 'package:mobile_banking/view/splash/bloc/splash_bloc.dart';
import 'package:mobile_banking/view/splash/bloc/splash_events.dart';
import 'package:mobile_banking/view/splash/bloc/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Widget get page {
    return BlocProvider(
      create: (context) => SplashScreenBloc(getIt.get()),
      child: this,
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    openScreen();
  }

  void nextScreen(SplashScreenBloc bloc){
    if (!context.mounted) return;
    switch (bloc.state.screenEnum??SplashScreenEnum.calm) {
      case SplashScreenEnum.calm:
        {
          break;
        }
      case SplashScreenEnum.main:
        {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const MainScreen(),
            ),
          );
          break;
        }
      case SplashScreenEnum.login:
        {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => LoginScreen().page,
            ),
          );
          break;
        }
    }
  }

  void openScreen() async {
    final bloc = context.read<SplashScreenBloc>();
    bloc.add(NavigateToScreen());
    await Future.delayed(const Duration(seconds: 1));
    nextScreen(bloc);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                "assets/images/qovun.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
