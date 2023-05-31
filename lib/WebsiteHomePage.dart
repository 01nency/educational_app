// ignore_for_file: file_names

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:educational_app/w3school_screen.dart';
import 'package:educational_app/wikipedia_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationHome extends StatefulWidget {
  const EducationHome({Key? key}) : super(key: key);

  @override
  State<EducationHome> createState() => _EducationHomeState();
}

class _EducationHomeState extends State<EducationHome> {
  var currentpos = 0;
  List<Platformsurl> subjects = [
    Platformsurl(
        platformimg: 'assets/dbms_book.jpg',
        url:
            'https://ebooks.lpude.in/management/mba/term_3/DCAP204_MANAGING_DATABASE_DCAP402_DATABASE_MANAGEMENT_SYSTEMS.pdf'),
            // 'https://mrcet.com/downloads/digital_notes/ECE/III%20Year/DATABASE%20MANAGEMENT%20SYSTEMS.pdf'),
    Platformsurl(
        platformimg: 'assets/compilerdesign_book.jpg',
        url:
            'https://rdw.rowan.edu/cgi/viewcontent.cgi?article=1001&context=oer'),
    Platformsurl(
        platformimg: 'assets/datascience_book.jpg',
        url: 'https://faculty.washington.edu/otoomet/machineLearning.pdf'),
    Platformsurl(
        platformimg: 'assets/foundationsofcs_book.jpg',
        url: 'https://www.cl.cam.ac.uk/teaching/2000/FoundsCS/Founds-FP.pdf'),
  ];

  final List<Platforms> platforms = [
    Platforms(
        name: 'Wikipedia',
        logo: 'assets/wikipedia_logo.jpg',
        designUI: const WikipediaScreen()),
    Platforms(
        name: 'W3schools',
        logo: 'assets/w3schools_logo.png',
        designUI: const W3schoolScreen()),
    Platforms(
        name: 'Wikipedia',
        logo: 'assets/tutorialspoint_logo.png',
        designUI: const WikipediaScreen()),
    Platforms(
        name: 'Wikipedia',
        logo: 'assets/javatpoint_logo.png',
        designUI: const WikipediaScreen()),
  ];

  void _lunchURL(String urlScheme) async {
    Uri url = Uri.parse(urlScheme);
    if (!await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.blueGrey,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          'GeniusHub',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.blueGrey),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'BookMark'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Library'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'profile'),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Popular on App',
                style: TextStyle(
                    color: Color(0xff22666e),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              CarouselSlider(
                items: choices.map((e) {
                  return SizedBox(
                    height: 400,
                    width: 300,
                    child: Card(
                      shadowColor: Colors.grey.shade200,
                      elevation: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            height: 400,
                            width: 130,
                            child: Image.asset(
                              e.img,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 400,
                            width: 130,
                            child: ListTile(
                              title: Text(e.title),
                              subtitle: Text(e.content),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  // autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        currentpos = index;
                      },
                    );
                  },
                ),
              ),
              Center(
                child: CarouselIndicator(
                  color: Colors.grey.shade200,
                  activeColor: Colors.blueGrey,
                  count: choices.length,
                  index: currentpos,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Educational Apps',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: platforms.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final platform = platforms[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => platform.designUI),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              foregroundImage: AssetImage(
                                platforms[index].logo,
                              ),
                              radius: 40,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Text(
                'Trend on App',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 20.0),
                  itemCount: subjects.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _lunchURL(subjects[index].url);
                      },
                      child: Image.asset(
                        subjects[index].platformimg,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Platforms {
  final String name;
  final String logo;
  final Widget designUI;

  Platforms({required this.name, required this.logo, required this.designUI});
}

class Platformsurl {
  final String platformimg;
  final String url;

  Platformsurl({this.platformimg = "", this.url = ""});
}

class Choice {
  const Choice({this.img = "", this.content = "", this.title = ""});

  final String img;
  final String title;
  final String content;
}

const List<Choice> choices = <Choice>[
  Choice(
      img: 'assets/wikipedia_logo.jpg',
      title: 'WIKIPEDIA',
      content:
          'Wikipedia is a free, open content online encyclopedia created through the collaborative effort of a community of users known as Wikipedians.'),
  Choice(
      img: 'assets/w3schools_logo.png',
      title: 'W3SCHOOL',
      content:
          'W3Schools is a freemium educational website for learning coding online. Initially released in 1998.'),
  Choice(
      img: 'assets/tutorialspoint_logo.png',
      title: 'TUTORIALSPOINT',
      content:
          'Tutorials Point originated from the idea that there exists a class of readers who respond better to online content '),
  Choice(
      img: 'assets/javatpoint_logo.png',
      title: 'JAVATPOINT',
      content:
          'JavaTpoint provides easy and point to point learning of various online tutorials such as Java, Android, Design Pattern, and Python etc.'),
];
