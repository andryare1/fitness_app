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
    imageUrl: 'assets/exercise/press_bench.png',
  ),
  Exercise(
    name: 'Брусья на низ груди',
    description: 'Упражнение для акцента на нижнюю часть грудных мышц.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/dips_lower_chest.png',
  ),
  Exercise(
    name: 'Разводка с гантелями',
    description: 'Для изоляции грудных мышц.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/dumbbell_fly.png',
  ),
  Exercise(
    name: 'Отжимания на кольцах',
    description: 'Сложное упражнение для укрепления грудных мышц.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/ring_pushups.png',
  ),
  Exercise(
    name: 'Пуловер с гантелью',
    description: 'Комбинированное упражнение для грудных мышц и спины.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/dumbbell_pullover.png',
  ),
  Exercise(
    name: 'Жим гантелей под углом',
    description: 'Упражнение для верхней части грудных мышц.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/incline_dumbbell_press.png',
  ),
  Exercise(
    name: 'Отжимания от пола',
    description: 'Классическое упражнение на грудные мышцы.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/pushups.png',
  ),
  Exercise(
    name: 'Кроссовер',
    description: 'Работа на блоках для изоляции грудных.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/crossover.png',
  ),
  Exercise(
    name: 'Отжимания узким хватом',
    description: 'Фокус на внутреннюю часть грудных.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/close_grip_pushups.png',
  ),
  Exercise(
    name: 'Сведение рук в тренажёре',
    description: 'Изоляция для грудных мышц.',
    muscleGroup: 'Грудь',
    imageUrl: 'assets/exercise/pec_deck.png',
  ),

  // Спина
  Exercise(
    name: 'Подтягивания широким хватом',
    description: 'Классическое упражнение для широчайших мышц.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/wide_pullups.png',
  ),
  Exercise(
    name: 'Тяга штанги в наклоне',
    description: 'Развитие широчайших и ромбовидных мышц.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/barbell_row.png',
  ),
  Exercise(
    name: 'Тяга блока к груди',
    description: 'Имитация подтягиваний с нагрузкой.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/lat_pulldown.png',
  ),
  Exercise(
    name: 'Тяга горизонтального блока',
    description: 'Фокус на толщину спины.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/seated_row.png',
  ),
  Exercise(
    name: 'Становая тяга',
    description: 'Базовое упражнение для всей спины.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/deadlift.png',
  ),
  Exercise(
    name: 'Тяга гантели к поясу',
    description: 'Для нижней части широчайших.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/one_arm_row.png',
  ),
  Exercise(
    name: 'Гиперэкстензии',
    description: 'Укрепление поясничного отдела.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/hyperextensions.png',
  ),
  Exercise(
    name: 'Подтягивания обратным хватом',
    description: 'Фокус на нижнюю часть широчайших.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/chinups.png',
  ),
  Exercise(
    name: 'Тяга штанги к подбородку',
    description: 'Верхняя часть спины.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/upright_row.png',
  ),
  Exercise(
    name: 'Тяга "Т-грифа"',
    description: 'Для толщины средней части спины.',
    muscleGroup: 'Спина',
    imageUrl: 'assets/exercise/t_bar_row.png',
  ),

  // Плечи
  Exercise(
    name: 'Жим штанги стоя',
    description: 'Базовое упражнение для плечевого пояса.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/overhead_press.png',
  ),
  Exercise(
    name: 'Махи гантелями в стороны',
    description: 'Для средней дельты.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/lateral_raise.png',
  ),
  Exercise(
    name: 'Арнольд-пресс',
    description: 'Для проработки всех пучков дельт.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/arnold_press.png',
  ),
  Exercise(
    name: 'Махи гантелями в наклоне',
    description: 'Фокус на заднюю дельту.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/rear_delt_raise.png',
  ),
  Exercise(
    name: 'Тяга штанги к подбородку',
    description: 'Для трапециевидной мышцы и дельт.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/upright_row.png',
  ),
  Exercise(
    name: 'Жим гантелей сидя',
    description: 'Для верхней части плеч.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/seated_dumbbell_press.png',
  ),
  Exercise(
    name: 'Обратные махи',
    description: 'Для заднего пучка дельт.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/reverse_fly.png',
  ),
  Exercise(
    name: 'Жим Арнольда стоя',
    description: 'Сложное упражнение на все пучки дельт.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/arnold_press_standing.png',
  ),
  Exercise(
    name: 'Пуловер с гантелями',
    description: 'Для трапециевидной и дельтовидной мышцы.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/dumbbell_pullover.png',
  ),
  Exercise(
    name: 'Жим в тренажере',
    description: 'Для изоляции плечевого пояса.',
    muscleGroup: 'Плечи',
    imageUrl: 'assets/exercise/machine_press.png',
  ),
  // Руки
Exercise(
  name: 'Подъем гантелей на бицепс',
  description: 'Классическое упражнение для развития бицепса.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/bicep_curl.png',
),
Exercise(
  name: 'Молотковые сгибания',
  description: 'Упражнение для брахиалиса и бицепса.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/hammer_curl.png',
),
Exercise(
  name: 'Французский жим',
  description: 'Для развития трицепса.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/tricep_extension.png',
),
Exercise(
  name: 'Разгибания на блоке',
  description: 'Изоляция трицепса с использованием блока.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/tricep_pushdown.png',
),
Exercise(
  name: 'Сгибание рук со штангой',
  description: 'Базовое упражнение для бицепсов.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/barbell_curl.png',
),
Exercise(
  name: 'Концентрированные сгибания',
  description: 'Фокус на пик бицепса.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/concentration_curl.png',
),
Exercise(
  name: 'Обратные разгибания рук на трицепс',
  description: 'Изоляция трицепса с гантелями.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/tricep_kickback.png',
),
Exercise(
  name: 'Обратные отжимания',
  description: 'Упражнение с собственным весом для трицепса.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/dips_triceps.png',
),
Exercise(
  name: 'Жим узким хватом',
  description: 'Для развития трицепсов.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/close_grip_bench.png',
),
Exercise(
  name: 'Сгибания рук на скамье Скотта',
  description: 'Изоляция бицепса.',
  muscleGroup: 'Руки',
  imageUrl: 'assets/exercise/preacher_curl.png',
),
// Ноги
Exercise(
  name: 'Приседания со штангой',
  description: 'Базовое упражнение для развития ног и ягодиц.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/squat.png',
),
Exercise(
  name: 'Выпады с гантелями',
  description: 'Для проработки квадрицепсов и ягодиц.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/lunges.png',
),
Exercise(
  name: 'Мертвая тяга',
  description: 'Для задней поверхности бедра.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/deadlift_legs.png',
),
Exercise(
  name: 'Подъемы на носки стоя',
  description: 'Для развития икроножных мышц.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/calf_raise.png',
),
Exercise(
  name: 'Сгибания ног в тренажере',
  description: 'Для изоляции задней поверхности бедра.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/leg_curl.png',
),
Exercise(
  name: 'Разгибания ног в тренажере',
  description: 'Для изоляции квадрицепсов.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/leg_extension.png',
),
Exercise(
  name: 'Приседания с гантелями',
  description: 'Упрощенная версия приседаний со штангой.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/dumbbell_squat.png',
),
Exercise(
  name: 'Жим ногами в тренажере',
  description: 'Базовое упражнение для квадрицепсов.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/leg_press.png',
),
Exercise(
  name: 'Болгарские сплит-приседания',
  description: 'Для квадрицепсов и ягодиц.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/bulgarian_split_squat.png',
),
Exercise(
  name: 'Румынская тяга',
  description: 'Для задней поверхности бедра и ягодиц.',
  muscleGroup: 'Ноги',
  imageUrl: 'assets/exercise/romanian_deadlift.png',
),
// Пресс
Exercise(
  name: 'Подъем корпуса',
  description: 'Классическое упражнение для прямой мышцы живота.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/crunch.png',
),
Exercise(
  name: 'Планка',
  description: 'Универсальное упражнение для всего корпуса.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/plank.png',
),
Exercise(
  name: 'Подъем ног в висе',
  description: 'Для нижнего отдела пресса.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/leg_raise.png',
),
Exercise(
  name: 'Скручивания на фитболе',
  description: 'Для прямой мышцы живота.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/ball_crunch.png',
),
Exercise(
  name: 'Русские скручивания',
  description: 'Для косых мышц живота.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/russian_twist.png',
),
Exercise(
  name: 'Боковая планка',
  description: 'Для косых мышц живота.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/side_plank.png',
),
Exercise(
  name: 'Велосипед',
  description: 'Для косых и прямой мышцы живота.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/bicycle_crunch.png',
),
Exercise(
  name: 'Касание пяток',
  description: 'Для бокового пресса.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/heel_touch.png',
),
Exercise(
  name: 'Динамическая планка',
  description: 'Сложная вариация планки.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/dynamic_plank.png',
),
Exercise(
  name: 'Складка',
  description: 'Для всего пресса.',
  muscleGroup: 'Пресс',
  imageUrl: 'assets/exercise/v_sit.png',
),    
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
