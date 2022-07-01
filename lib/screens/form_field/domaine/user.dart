class User {
  final String name;
  final String money;
  final int id;

  User({
    required this.name,
    required this.money,
    required this.id,
  });

  @override
  String toString() {
    return ' User {name: @$name, money: $money, id: $id,}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.money == money &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ money.hashCode ^ id.hashCode;
  }
}
