class Package {
  final String id;
  final String name;
  final List<String> items;
  final int price;
  final List<String> badges;

  Package({required this.id, required this.name, required this.items, required this.price, required this.badges});

  factory Package.mock(String name) {
    return Package(
      id: name.toLowerCase().replaceAll(' ', '_'),
      name: name,
      items: ['Item 1', 'Item 2'],
      price: 499,
      badges: ['Top Seller'],
    );
  }
}
