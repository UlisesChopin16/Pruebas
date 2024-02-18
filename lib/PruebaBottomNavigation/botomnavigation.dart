import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:prueba/PruebaBottomNavigation/vistaprincipal.dart';

class Botomnavigation extends StatefulWidget {
  const Botomnavigation({super.key});

  @override
  State<Botomnavigation> createState() => _BotomnavigationState();
}

class _BotomnavigationState extends State<Botomnavigation> {
  final PageController _pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  Widget showPage = const Vistaprincipal();

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return const Center(
          child: Text('Home'),
        );
      case 1:
        return const Vistaprincipal();
      case 2:
        return const Center(
          child: Text('School'),
        );
      case 3:
        return const Center(
          child: Text('Settings'),
        );
      default:
        return const Center(
          child: Text('Home'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text('Menu'),
      ),
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: const [
              Center(child: Text('Home')),
              Vistaprincipal(),
              Center(child: Text('School')),
              Center(child: Text('Settings')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        height: 50.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.business, size: 30),
          Icon(Icons.school, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            showPage = pageChooser(index);
            _pageController.jumpToPage(
              index,
              // duration: const Duration(milliseconds: 100),
              // curve: Curves.easeInOut
            );
          });
        },
      ),
    );
  }
}