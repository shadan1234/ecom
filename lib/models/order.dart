class Order {
  final String id;
  final String status;
  final double total;
  final String address;
  final List<String> items;

  Order({required this.id, required this.status, required this.total, required this.address, required this.items});
}
