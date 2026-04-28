import 'package:dartz/dartz.dart' hide Order;
import '../../mi_proyecto_domain.dart';

abstract class ICheckoutRepository {
  Future<Either<Failure, Order>> placeOrder(List<Product> items);
}
