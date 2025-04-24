import 'package:flutter/material.dart';
import 'package:huanmaiw/Home/pages/activity.dart';
import 'pages/home.dart';
import 'pages/my_card.dart';
import 'pages/profile.dart';
import 'pages/scan.dart';
void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 16, 80, 98)),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const Home(),
    const MyCardPage(),
    const ScanPage(),
    const ActivityPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tabItem(Icons.home, "Home", 0),
            tabItem(Icons.credit_card, "My Card", 1),
            FloatingActionButton(
              onPressed: () => onTabTapped(2),
              backgroundColor: const Color.fromARGB(255, 16, 80, 98),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
            ),
            tabItem(Icons.bar_chart, "Activity", 3),
            tabItem(Icons.person, "Profile", 4),
          ],
        ),
      ),
    );
  }

  Widget tabItem(IconData icon, String label, int index) {
    return IconButton(
      onPressed: () => onTabTapped(index),
      icon: Column(
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.black : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 10,
                color: currentIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
