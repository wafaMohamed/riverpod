import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/products_providers.dart';
import 'package:riverpod_files/shared/cart_icon.dart';
import '../../models/product.dart';
import '../../providers/cart_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ConsumerWidget == stateless widget and add a WidgetRef as a ref parameter in build method
    // we need update the ui when listening for data changes
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    // listen just only listen without return value
    // watch -> listen + return value
    // read -> return value
    /** ref provides some methods like:
        1- read provider methods (ref.read) build
        2- watch provide data for changes (listen + build) ref.watch
        3- get the updated data
        4- refresh the provider state with ref.refresh

     **/
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(
                    allProducts[index].image,
                    width: 60,
                    height: 60,
                  ),
                  Text(allProducts[index].title),
                  Text('${allProducts[index].price} \$'),
                  if (cartProducts.contains(allProducts[index]))
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            ref.read(cartNotifierProvider.notifier).removeProduct(allProducts[index]);
                          },
                          child: const Text(
                            'Remove',
                          )),
                    ),
                  if (!cartProducts.contains(allProducts[index]))
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            // notifier come when we use Notifier class which is state then we provider a provider for it to access on this state and make an event by .notifier
                            // with notifier -> event
                            // without notifier -> state
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addProduct(allProducts[index]);
                          },
                          child: const Text('Add')),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
