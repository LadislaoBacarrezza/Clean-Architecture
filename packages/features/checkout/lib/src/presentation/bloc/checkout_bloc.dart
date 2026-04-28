import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final PlaceOrderUseCase placeOrderUseCase;

  CheckoutBloc({required this.placeOrderUseCase}) : super(CheckoutInitial()) {
    on<ConfirmCheckoutEvent>((event, emit) async {
      emit(CheckoutLoading());

      final result = await placeOrderUseCase.execute(event.items);

      result.fold(
        (failure) => emit(CheckoutFailure(failure.message)),
        (order) => emit(CheckoutSuccess(order)),
      );
    });

    on<ResetCheckoutEvent>((event, emit) {
      emit(CheckoutInitial());
    });
  }
}
