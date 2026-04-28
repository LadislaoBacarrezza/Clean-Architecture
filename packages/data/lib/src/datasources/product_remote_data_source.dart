import '../models/product_model.dart';

/// Interfaz para el origen de datos remoto
abstract class IProductRemoteDataSource {
  Future<ProductModel> getProductById(String id);
}

/// Implementación específica para gRPC
class ProductRemoteDataSourceImpl implements IProductRemoteDataSource {
  final dynamic grpcClient; // Sustituir por tu clase autogenerada de gRPC

  ProductRemoteDataSourceImpl(this.grpcClient);

  @override
  Future<ProductModel> getProductById(String id) async {
    try {
      // Llamada directa al servicio gRPC
      final response = await grpcClient.getProduct(id: id);

      // Convertimos la respuesta gRPC al modelo de datos
      return ProductModel.fromGrpc(response);
    } catch (e) {
      throw Exception("Error de conexión gRPC: $e");
    }
  }
}
