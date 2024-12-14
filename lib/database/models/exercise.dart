import 'package:floor/floor.dart';

@entity
class Exercise {
  @primaryKey
  final int? id; // Поле id
  final String name; // Название упражнения
  final String description; // Описание упражнения
  final String muscleGroup; // Группа мышц
  final String imageUrl; // URL изображения

  Exercise({
    this.id,
    required this.name,
    required this.description,
    required this.muscleGroup,
    required this.imageUrl,
  });
}
