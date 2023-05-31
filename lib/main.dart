import 'dart:async';

import 'package:educational_app/WebsiteHomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EducationalApp());
}

class EducationalApp extends StatelessWidget {
  const EducationalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Educational Website',
      home: EducationalScreen(),
    );
  }
}

class EducationalScreen extends StatefulWidget {
  const EducationalScreen({Key? key}) : super(key: key);

  @override
  State<EducationalScreen> createState() => _EducationalScreenState();
}

class _EducationalScreenState extends State<EducationalScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const EducationHome()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffadd8e6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Icon(
              Icons.history_edu,
              size: 100,
              color: Color(0xffff7f50),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'GeniusHub',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xffff7f50),
            ),
          ),
        ],
      ),
    );
  }
}
