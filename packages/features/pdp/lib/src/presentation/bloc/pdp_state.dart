import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';

sealed class PdpState {}

class PdpInitial extends PdpState {}

class PdpLoading extends PdpState {}

class PdpLoaded extends PdpState {
  final Product product;
  PdpLoaded(this.product);
}

class PdpError extends PdpState {
  final String message;
  PdpError(this.message);
}
