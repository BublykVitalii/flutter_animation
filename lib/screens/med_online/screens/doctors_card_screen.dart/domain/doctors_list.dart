import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/doctor.dart';

class DoctorList {
  List<Doctor> get doctors => _doctors;

  final _doctors = <Doctor>[
    Doctor(
      name: 'Яроцкая Ж.Г',
      speciality: 'Хирург',
      experience: 'Стаж 10 лет',
      id: 0,
    ),
    Doctor(
      name: 'Явицкий Г.К',
      speciality: 'Фельдшер',
      experience: 'Стаж 11 лет',
      id: 1,
    ),
    Doctor(
      name: 'Зеленский В.А',
      speciality: 'Судмедэксперт',
      experience: 'Стаж 40 лет',
      id: 2,
    ),
    Doctor(
      name: 'Дуда А.Р',
      speciality: 'Провизор',
      experience: 'Стаж 5 лет',
      id: 3,
    ),
    Doctor(
      name: 'Куть О.В',
      speciality: 'Рентгенолог',
      experience: 'Стаж 20 лет',
      id: 4,
    ),
    Doctor(
      name: 'Касьяненько Е.М',
      speciality: 'Пластический хирург',
      experience: 'Стаж 30 лет',
      id: 5,
    ),
    Doctor(
      name: 'Тян О.Д',
      speciality: 'Реабилитолог',
      experience: 'Стаж 22 лет',
      id: 6,
    ),
    Doctor(
      name: 'Луза К.А',
      speciality: 'Акушер',
      experience: 'Стаж 14 лет',
      id: 7,
    ),
    Doctor(
      name: 'Калина В.И',
      speciality: 'Патологоанатом',
      experience: 'Стаж 33 лет',
      id: 8,
    ),
    Doctor(
      name: 'Чушь В.И',
      speciality: 'Отоларинголог',
      experience: 'Стаж 3 лет',
      id: 9,
    ),
    Doctor(
      name: 'Высь И.К',
      speciality: 'Оптометрис',
      experience: 'Стаж 6 лет',
      id: 10,
    ),
    Doctor(
      name: 'Солодовник Ф.К',
      speciality: 'Нарколог',
      experience: 'Стаж 34 лет',
      id: 11,
    ),
    Doctor(
      name: 'Лещь К.О',
      speciality: 'Медсестра',
      experience: 'Стаж 2 лет',
      id: 12,
    ),
    Doctor(
      name: 'Вельзевул А.Д',
      speciality: 'Нейрохирург',
      experience: 'Стаж 6 лет',
      id: 13,
    ),
  ];
}
