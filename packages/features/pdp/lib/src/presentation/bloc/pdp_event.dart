sealed class PdpEvent {}

class LoadProductEvent extends PdpEvent {
  final String productId;
  LoadProductEvent(this.productId);
}
