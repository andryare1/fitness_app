import 'package:flutter/material.dart';
import 'exercise_list_page.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> muscleGroups = [
      {
        'name': 'Грудь',
        'image': 'assets/muscleGroup/chest.png',
      },
      {
        'name': 'Спина',
        'image': 'assets/muscleGroup/back.png',
      },
      {
        'name': 'Плечи',
        'image': 'assets/muscleGroup/shoulders.png',
      },
      {
        'name': 'Руки',
        'image': 'assets/muscleGroup/hands.png',
      },
      {
        'name': 'Ноги',
        'image': 'assets/muscleGroup/legs.png',
      },
      {
        'name': 'Пресс',
        'image': 'assets/muscleGroup/abs.png',
      },
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: muscleGroups.length,
      itemBuilder: (context, index) {
        final group = muscleGroups[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ExerciseListPage(muscleGroup: group['name']!),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12.0)),
                    child: Image.asset(
                      group['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    group['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}