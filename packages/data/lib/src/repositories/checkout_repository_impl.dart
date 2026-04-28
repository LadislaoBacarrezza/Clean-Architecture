import 'package:dartz/dartz.dart' hide Order;
import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';
import '../models/order_model.dart';

class CheckoutRepositoryImpl implements ICheckoutRepository {
  final dynamic grpcClient;

  CheckoutRepositoryImpl(this.grpcClient);

  @override
  Future<Either<Failure, Order>> placeOrder(List<Product> items) async {
    try {
      // En un entorno gRPC real, aquí enviarías los IDs de los productos
      final response = await grpcClient.placeOrder(
        items: items.map((e) => e.id).toList(),
      );
      return Right(OrderModel.fromGrpc(response));
    } catch (e) {
      return Left(ServerFailure("Error al procesar el pago / orden"));
    }
  }
}
