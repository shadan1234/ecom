class Category {
  final String id;
  final String name;
  final String icon;

  Category({required this.id, required this.name, required this.icon});

  factory Category.mock(String name, String icon) {
    return Category(id: name.toLowerCase(), name: name, icon: icon);
  }
}
