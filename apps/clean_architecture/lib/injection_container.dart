import 'package:get_it/get_it.dart';
import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';
import 'package:mi_proyecto_data/mi_proyecto_data.dart';
import 'package:pdp_feature/pdp_feature.dart';
import 'package:checkout_feature/checkout_feature.dart';

final sl = GetIt.instance; // sl = Service Locator

Future<void> init() async {
  //! 1. Features - Blocs / Cubits
  sl.registerFactory(() => PdpBloc(sl(), sl()));
  sl.registerFactory(() => CheckoutBloc(placeOrderUseCase: sl()));

  //! 2. Use Cases (Dominio)
  sl.registerLazySingleton(() => GetProductDetailUseCase(sl()));
  sl.registerLazySingleton(() => PlaceOrderUseCase(sl()));

  //! 3. Repositories (Data)
  sl.registerLazySingleton(() => MockGrpcClient());
  sl.registerLazySingleton<IProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl<MockGrpcClient>()),
  );
  sl.registerLazySingleton<IProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ICheckoutRepository>(
    () => CheckoutRepositoryImpl(sl<MockGrpcClient>()),
  );
  sl.registerLazySingleton<IAnalyticsRepository>(
    () => AnalyticsRepositoryImpl(),
  );

  //! 4. External (Infraestructura pura)
  // Aquí registrarías tu cliente gRPC o el objeto de conexión
  // sl.registerLazySingleton(() => MiClienteGrpc());
  sl.registerLazySingleton(() => "Cliente gRPC temporal");
}
