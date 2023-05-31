import 'package:flutter/material.dart';

import 'html_screen.dart';

class W3schoolScreen extends StatefulWidget {
  const W3schoolScreen({Key? key}) : super(key: key);

  @override
  State<W3schoolScreen> createState() => _W3schoolScreenState();
}

class _W3schoolScreenState extends State<W3schoolScreen> {
  void navigateToTutorial(BuildContext context, String tutorialName) {
    switch (tutorialName) {
      case 'HTML':
        Navigator.pushNamed(context, '/html');
        break;
      case 'CSS':
        Navigator.pushNamed(context, '/css');
        break;
      case 'JavaScript':
        Navigator.pushNamed(context, '/javascript');
        break;
      case 'Python':
        Navigator.pushNamed(context, '/python');
        break;
      default:
        // ignore: avoid_print
        print('Invalid tutorial name: $tutorialName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('W3Schools'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HtmlTutorialScreen()));
              },
              child: const Text('HTML Tutorial'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CssTutorialScreen()));
              },
              child: const Text('CSS Tutorial'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const JavaScriptTutorialScreen()));
              },
              child: const Text('JavaScript Tutorial'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PythonTutorialScreen()));
              },
              child: const Text('Python Tutorial'),
            ),
          ],
        ),
      ),
    );
  }
}

class CssTutorialScreen extends StatelessWidget {
  const CssTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSS Tutorial'),
      ),
      body: const Center(
        child: Text('CSS Tutorial Screen'),
      ),
    );
  }
}

class JavaScriptTutorialScreen extends StatelessWidget {
  const JavaScriptTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JavaScript Tutorial'),
      ),
      body: const Center(
        child: Text('JavaScript Tutorial Screen'),
      ),
    );
  }
}

class PythonTutorialScreen extends StatelessWidget {
  const PythonTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Tutorial'),
      ),
      body: const Center(
        child: Text('Python Tutorial Screen'),
      ),
    );
  }
}
