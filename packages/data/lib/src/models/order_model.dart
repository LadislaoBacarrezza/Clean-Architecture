import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';

class OrderModel extends Order {
  OrderModel({
    required super.id,
    required super.items,
    required super.totalAmount,
    required super.createdAt,
  });

  // Mapeador para la respuesta del servidor
  factory OrderModel.fromGrpc(dynamic response) {
    return OrderModel(
      id: response.orderId,
      items: [], // Aquí mapearías la lista de productos si gRPC los devuelve
      totalAmount: response.total.toDouble(),
      createdAt: DateTime.now(),
    );
  }
}
