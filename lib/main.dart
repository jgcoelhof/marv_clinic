import 'package:flutter/material.dart';
import 'package:marv_clinic/pages/splash.dart';

void main() {
  runApp(const MarvClinic());
}

class MarvClinic extends StatelessWidget {
  const MarvClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
