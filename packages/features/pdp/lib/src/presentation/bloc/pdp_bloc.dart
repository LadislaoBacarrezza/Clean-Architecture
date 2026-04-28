// packages/features/pdp/lib/src/presentation/bloc/pdp_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';
import 'package:pdp_feature/src/presentation/bloc/pdp_event.dart';
import 'package:pdp_feature/src/presentation/bloc/pdp_state.dart';

class PdpBloc extends Bloc<PdpEvent, PdpState> {
  final GetProductDetailUseCase getProductDetail;
  final IAnalyticsRepository analytics;

  PdpBloc(this.getProductDetail, this.analytics) : super(PdpInitial()) {
    // Registramos el manejador del evento
    on<LoadProductEvent>((event, emit) async {
      emit(PdpLoading());

      final result = await getProductDetail.execute(event.productId);

      result.fold((error) => emit(PdpError(error.message)), (product) {
        analytics.logEvent(
          'view_item',
          parameters: {
            'item_id': product.id,
            'item_name': product.name,
            'price': product.price,
          },
        );

        emit(PdpLoaded(product));
      });
    });
  }
}
