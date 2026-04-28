import 'product.dart';

class Order {
  final String id;
  final List<Product> items;
  final double totalAmount;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.createdAt,
  });
}
