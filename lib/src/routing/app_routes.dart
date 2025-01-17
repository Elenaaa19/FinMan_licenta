import 'package:flutter/material.dart';
import '../features/authentifications/screen/welcome_screen.dart';
import '../features/authentifications/screen/login_screen.dart';
import '../features/authentifications/screen/register_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/authentifications/screen/home_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => OnboardingScreen(),
    '/welcome': (context) => WelcomeScreen(),
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
    '/home': (context) => HomeScreen(),
  };
}
