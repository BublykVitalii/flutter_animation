class MedCentre {
  final String name;
  final int id;

  MedCentre({
    required this.name,
    required this.id,
  });

  @override
  String toString() {
    return ' User {name: @$name,  id: $id,}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MedCentre && other.name == name && other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode;
  }
}
