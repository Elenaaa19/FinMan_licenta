import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../authentifications/screen/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  static Widget _buildPage({
    required BuildContext context,
    required Color color,
    required String text,
    bool showButton = false,
  }) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            if (showButton)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Welcome Screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  },
                  child: Text('Get Started'),
                ),
              ),
            SizedBox(height: 50),
            if (!showButton)
              Column(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Swipe to Continue',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildPage(
        context: context,
        color: Colors.blue,
        text: 'Welcome to FinMan',
      ),
      _buildPage(
        context: context,
        color: Colors.green,
        text: 'Track your finances effortlessly',
      ),
      _buildPage(
        context: context,
        color: Colors.purple,
        text: 'Let\'s get started!',
        showButton: true,
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            onPageChangeCallback: (index) {
              setState(() {
                currentPage = index;
              });
            },
            fullTransitionValue: 600,
            waveType: WaveType.liquidReveal,
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: currentPage == index ? 12 : 8,
      height: currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Colors.white38,
        shape: BoxShape.circle,
      ),
    );
  }
}
