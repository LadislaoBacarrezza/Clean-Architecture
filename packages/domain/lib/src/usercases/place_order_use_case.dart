import 'package:dartz/dartz.dart' hide Order;
import '../entities/order.dart';
import '../entities/product.dart';
import '../repositories/i_checkout_repository.dart';
import '../error/failures.dart';

class PlaceOrderUseCase {
  final ICheckoutRepository repository;

  PlaceOrderUseCase(this.repository);

  Future<Either<Failure, Order>> execute(List<Product> items) {
    return repository.placeOrder(items);
  }
}
