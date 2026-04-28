class MockProductResponse {
  final String id;
  final String name;
  final double price;

  MockProductResponse({
    required this.id,
    required this.name,
    required this.price,
  });
}

class MockCheckoutResponse {
  final String orderId;
  final double total;
  MockCheckoutResponse({required this.orderId, required this.total});
}

class MockGrpcClient {
  Future<MockProductResponse> getProduct({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return MockProductResponse(
      id: id,
      name: "Producto Mock desde Capa Data",
      price: 1250.50,
    );
  }

  Future<MockCheckoutResponse> placeOrder({required List<String> items}) async {
    await Future.delayed(const Duration(seconds: 1));
    return MockCheckoutResponse(
      orderId: "ORD-${DateTime.now().millisecondsSinceEpoch}",
      total: 1316.00, // Simulado
    );
  }
}
