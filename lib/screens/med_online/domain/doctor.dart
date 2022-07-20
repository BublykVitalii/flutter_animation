class Doctor {
  final String name;
  final String speciality;
  final String experience;
  final int id;

  Doctor({
    required this.name,
    required this.speciality,
    required this.experience,
    required this.id,
  });

  @override
  String toString() {
    return ' User {name: @$name, money: $speciality, id: $id,experience: $experience,}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Doctor &&
        other.name == name &&
        other.speciality == speciality &&
        other.experience == experience &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        speciality.hashCode ^
        experience.hashCode ^
        id.hashCode;
  }
}
