import 'package:dartz/dartz.dart';

import '../../mi_proyecto_domain.dart';

class GetProductDetailUseCase {
  final IProductRepository repository;

  GetProductDetailUseCase(this.repository);

  Future<Either<Failure, Product>> execute(String id) {
    return repository.getProductById(id);
  }
}
