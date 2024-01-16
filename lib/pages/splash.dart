import 'package:flutter/material.dart';
   import 'package:marv_clinic/widgets/navigation_drawer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double imageOpacity = 0;
  int timeToAnimationInMilliseconds = 2000;

  @override
  void initState() {
    waitAndShow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.asset(
                'assets/images/logo_1152.png',
                width: 300,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: timeToAnimationInMilliseconds),
              opacity: imageOpacity,
              curve: Curves.ease,
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Image.asset(
                  'assets/images/title_1152.png',
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  waitAndShow() {
    Future.delayed(const Duration(milliseconds: 700)).then((value) {
      setState(() {
        imageOpacity = 1;
      });
      waitAndNextScreen();
    });
  }

  waitAndNextScreen() {
    Future.delayed(Duration(milliseconds: timeToAnimationInMilliseconds + 300))
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NavigationDrawerWidget()));
    });
  }
}
