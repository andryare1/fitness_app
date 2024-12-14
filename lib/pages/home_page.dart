import 'package:fitness/pages/exercise_page.dart';
import 'package:fitness/pages/proofile_page.dart';
import 'package:flutter/material.dart';
import 'trainings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Список названий вкладок для AppBar
  final List<String> _titles = [
    'Главная',
    'Тренировки',
    'Упражнения',
    'Профиль',
  ];

  final List<Widget> _pages = [
    const Center(child: Text('Главная')), // Главная страница
    const TrainingsPage(), // Страница тренировок
    const ExercisesPage(), // Страница упражнений
    const ProfilePage(), // Страница профиля
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(_titles[_currentIndex]),
      )), 
      body: _pages[_currentIndex], // Отображаем текущую страницу
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.purple, // Цвет для выбранного элемента
        unselectedItemColor: Colors.grey, // Цвет для невыбранных элементов
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Тренировки'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Упражнения'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Профиль'),
        ],
      ),
    );
  }
}