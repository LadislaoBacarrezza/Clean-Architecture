import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';

class ProductModel extends Product {
  ProductModel({required super.id, required super.name, required super.price});

  // Mapeador: Convierte la respuesta binaria de gRPC a nuestra Entidad
  factory ProductModel.fromGrpc(dynamic grpcResponse) {
    return ProductModel(
      id: grpcResponse.id,
      name: grpcResponse.name,
      price: grpcResponse.price.toDouble(),
    );
  }
}
