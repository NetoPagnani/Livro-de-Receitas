import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'categories_sreen.dart';
import 'favorite_screen.dart';
import '../components/drawer_main.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  const TabsScreen(this.favoriteMeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreensIndex = 0;

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeal),
    ];
  }

  _selectedSreen(int index) {
    setState(() {
      _selectedScreensIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titles[_selectedScreensIndex],
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.yellow,
          ),
        ),
      ),
      drawer: DrawerMain(),
      body: _screens[_selectedScreensIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedSreen,
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedScreensIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_rounded,
            ),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_sharp,
            ),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
