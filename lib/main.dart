import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/routing/app_routes.dart';
import 'src/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB4WzBYd1mE1p5tZjEd8FXM0ULYRwmJLp4",
          authDomain: "finman-faff6.firebaseapp.com",
          projectId: "finman-faff6",
          storageBucket: "finman-faff6.firebasestorage.app",
          messagingSenderId: "797815444870",
          appId: "1:797815444870:web:fd58580a9e6126f8808807",
          measurementId: "G-W9TY0QYXJJ"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(FinManApp());
}

class FinManApp extends StatelessWidget {
  const FinManApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinMan',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
