import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';
import 'package:riverpod_files/providers/products_providers.dart';

class CartScreen extends ConsumerStatefulWidget {
  // ConsumerStatefulWidget == stateful widget
  // change the State into ConsumerState
  // It doesn't need the WidgetRef as a parameter it's already defined by default
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProduct = ref.watch(reducedProductsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProduct.map((Product product) {
                return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(product.image, width: 80, height: 80),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(product.title),
                      const Expanded(child: SizedBox()),
                      Text('${product.price}'),
                    ],
                  ),
                );
              }).toList(), // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
