import 'package:fitness/database/database_helper.dart';
import 'package:fitness/database/models/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseListPage extends StatefulWidget {
  final String muscleGroup;

  const ExerciseListPage({super.key, required this.muscleGroup});

  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  late Future<List<Exercise>> exercises;

  @override
  void initState() {
    super.initState();
    exercises = DatabaseHelper.getExercisesByMuscleGroup(widget.muscleGroup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.muscleGroup),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Вернуться назад
          },
        ),
      ),
      body: FutureBuilder<List<Exercise>>(
        future: exercises,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Ошибка: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Нет упражнений для этой группы мышц.'));
              }
              final exercises = snapshot.data!;
              return ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return ListTile(
                    leading: Image.asset(
                      exercise.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(exercise.name),
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

