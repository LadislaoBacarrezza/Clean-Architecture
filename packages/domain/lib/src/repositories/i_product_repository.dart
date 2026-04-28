import 'package:dartz/dartz.dart';
import '../../mi_proyecto_domain.dart';

abstract class IProductRepository {
  Future<Either<Failure, Product>> getProductById(String id);
}
