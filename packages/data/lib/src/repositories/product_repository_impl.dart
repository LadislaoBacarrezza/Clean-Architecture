import 'package:dartz/dartz.dart';
import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements IProductRepository {
  final IProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    try {
      final model = await remoteDataSource.getProductById(id);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure("No se pudo obtener el producto"));
    }
  }
}
