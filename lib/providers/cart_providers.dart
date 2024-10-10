import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';
// we use a (( notifier )) with (( post )) request cause we make an event like loading etc.
//------------------------------------------------------------------------------
// Notifier class notify consumer widgets about state changes in the future
// notifier is a generic class => pass data that will be working on it (type of data our state will be)
class CartNotifier extends Notifier<Set<Product>> {
  // initial value in the state
  @override
  Set<Product> build() {
    // return the Notifier<Set<Product>> -> set of product as initial value
    return {
      const Product(
        id: '4',
        title: 'Red Backpack',
        price: 14,
        image: 'assets/products/backpack.png',
      ),
    };
  }

// method to update the state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }
  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = {...state}..remove(product);
    }
  }
}

// create a provider to provide CartNotifier to any widget
// cause the CartNotifier ((not a provider))
// NotifierProvider<your notifier class , data type of generic in notifier>
// return instance of your Notifier
final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(
  () {
    //return instance of your Notifier
    return CartNotifier();
  },
);

