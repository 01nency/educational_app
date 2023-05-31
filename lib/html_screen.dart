import 'package:flutter/material.dart';

class HtmlTutorialScreen extends StatelessWidget {
  const HtmlTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [Image.asset('assets/html.png')],
        backgroundColor: Colors.green,
        title: const Text('HTML Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/html.png'),
            const Text(
              'Introduction to HTML',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              'HTML stands for HyperText Markup Language and '
                  'is the standard markup language used for creating web pages.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'HTML Element',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              'HTML elements are the building blocks of an HTML page. They are represented by tags such as <html>, <head>, <body>, <h1>, <p>, etc.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'HTML Attributes',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              'HTML attributes provide additional information about an element. They are specified within the start tag of an element and are composed of a name-value pair.',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
