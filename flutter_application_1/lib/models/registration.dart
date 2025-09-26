class Registration {
  final String name;
  final String email;
  final DateTime createdAt;
  Registration({required this.name, required this.email, DateTime? createdAt})
      : createdAt = createdAt ?? DateTime.now();

  String get createdAtLabel =>
      '${createdAt.year}-${_two(createdAt.month)}-${_two(createdAt.day)} ${_two(createdAt.hour)}:${_two(createdAt.minute)}';
  static String _two(int n) => n.toString().padLeft(2, '0');
}
