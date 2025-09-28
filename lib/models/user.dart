class User {
  final String id;
  final String name;
  final String phone;
  final String? email;
  final String? avatarUrl;

  User({required this.id, required this.name, required this.phone, this.email, this.avatarUrl});
}
