import 'package:flutter/material.dart';
import 'package:petition_ha/widgets/appBar.dart';
import '../pages/create_petition_screen/create_petition_screen.dart';
import '../pages/lenta_screen/lenta_screen.dart';
import '../pages/profile/profile.dart';
import '../pages/qa_screen/qa_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  final List<Widget> screens = [
    LentaScreen(),
    QAScreen(),
    CreatePetitionScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      body: screens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.question_answer),
            label: 'Кодекс',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_comment),
            label: 'Создать',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
