class Product {
  final String id;
  final String name;
  final String altName;
  final String imageUrl;
  final String unit;
  final int price;
  final int mrp;
  final int discount;
  final String details;
  final List<String> units;
  final List<Product> similar;

  Product({
    required this.id,
    required this.name,
    required this.altName,
    required this.imageUrl,
    required this.unit,
    required this.price,
    required this.mrp,
    required this.discount,
    required this.details,
    required this.units,
    required this.similar,
  });

  factory Product.mock(String name) {
    return Product(
      id: name.toLowerCase().replaceAll(' ', '_'),
      name: name,
      altName: name,
      imageUrl: 'https://via.placeholder.com/140',
      unit: '1 kg',
      price: 100,
      mrp: 120,
      discount: 20,
      details: 'Details about $name',
      units: ['1 kg', '500 g'],
      similar: [],
    );
  }
}
