import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedEyeLogo(),
            SizedBox(height: 20),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}

class AnimatedEyeLogo extends StatefulWidget {
  @override
  _AnimatedEyeLogoState createState() => _AnimatedEyeLogoState();
}

class _AnimatedEyeLogoState extends State<AnimatedEyeLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset('assets/eye_logo.png'), // Make sure to have the eye logo in the assets folder
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// To use this LoadingScreen, navigate to it from your main app widget:
// MaterialApp(home: LoadingScreen());