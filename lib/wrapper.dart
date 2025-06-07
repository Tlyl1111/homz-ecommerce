import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/features/authentication/screens/onboarding_welcome.dart';
import 'package:timberr/features/authentication/screens/splash_screen.dart';
import 'package:timberr/utils/app_routes.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    final session = Supabase.instance.client.auth.currentSession;
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('first_time') ?? true;

    if (session != null) {
      // User is logged in, go to home
      Get.offAllNamed(AppRoutes.home);
    } else if (isFirstTime) {
      // First time using the app, go to onboarding
      await prefs.setBool('first_time', false);
      Get.offAll(() => const OnBoardingWelcomeScreen());
    } else {
      // Not first time but not logged in, go to login
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kColorPrimary,
      body: Center(child: CircularProgressIndicator(color: kOffBlack)),
    );
  }
}
