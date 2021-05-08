class Users {
  Users({required this.uid});

  final String uid;
}

class UsersData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UsersData({
    required this.uid,
    required this.name,
    required this.sugars,
    required this.strength,
  });
}
