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
}
