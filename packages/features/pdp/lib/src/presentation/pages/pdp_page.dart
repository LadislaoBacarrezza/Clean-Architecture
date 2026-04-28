import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/pdp_bloc.dart';
import '../bloc/pdp_state.dart';
import '../bloc/pdp_event.dart';

class PdpPage extends StatelessWidget {
  const PdpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Producto')),
      body: BlocBuilder<PdpBloc, PdpState>(
        builder: (context, state) {
          if (state is PdpLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PdpLoaded) {
            final product = state.product;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_bag_outlined,
                      size: 100,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ID: ${product.id}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 48),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          context.push('/checkout');
                        },
                        icon: const Icon(Icons.payment),
                        label: const Text(
                          'IR AL CHECKOUT',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is PdpError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${state.message}'),
                  TextButton(
                    onPressed: () =>
                        context.read<PdpBloc>().add(LoadProductEvent('123')),
                    child: const Text('Intentar de nuevo'),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text('Presiona el botón de búsqueda para ver un producto'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PdpBloc>().add(LoadProductEvent('123'));
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
