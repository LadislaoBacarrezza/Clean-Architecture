import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';

sealed class CheckoutEvent {}

class ConfirmCheckoutEvent extends CheckoutEvent {
  final List<Product> items;

  ConfirmCheckoutEvent(this.items);
}

class ResetCheckoutEvent extends CheckoutEvent {}
