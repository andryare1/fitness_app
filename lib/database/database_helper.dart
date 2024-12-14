import 'package:fitness/database/app_database.dart';
import 'package:fitness/database/dao/exercise_dao.dart';
import 'package:fitness/database/models/exercise.dart';

class DatabaseHelper {
  static late final AppDatabase database;

  static Future<void> initialize() async {
    database = await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .build();

    // Загрузка данных при первом запуске
    final dao = database.exerciseDao;
    await dao.clearTable(); // Очистка таблицы перед добавлением данных
    await _loadInitialExercises(dao);
  }

  static Future<void> _loadInitialExercises(ExerciseDao dao) async {
    // Пример данных
    final exercises = [
      Exercise(
        name: 'Жим лёжа',
        description: 'Упражнение для развития грудных мышц.',
        muscleGroup: 'Грудь',
        imageUrl: 'assets/exercise/press_bench.jpg',
      ),
       Exercise(
        name: 'Брусья на низ груди',
        description: 'Исходное положение: руки на брусьях, локти направлены в стороны, голова опущена к груди, ноги согнуты и подняты к груди. На вдохе опускаемся, на выдохе поднимаемся, не следует полностью выпрямлять руки.',
        muscleGroup: 'Грудь',
        imageUrl: 'assets/exercise/press_bench.jpg',
      ),
      // Добавьте другие упражнения
    ];

    for (var exercise in exercises) {
      await dao.insertExercise(exercise);
    }
  }

  // Получение упражнений для группы мышц
  static Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup) {
    return database.exerciseDao.getExercisesByMuscleGroup(muscleGroup);
  }
}
