import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';
part 'cart_providers.g.dart';
// we use a (( notifier )) with (( post )) request cause we make an event like loading etc.
//------------------------------------------------------------------------------
// Notifier class notify consumer widgets about state changes in the future
// notifier is a generic class => pass data that will be working on it (type of data our state will be)
@riverpod
class CartNotifier extends _$CartNotifier {
  // instead of extends Notifier<Set<Product>> {
  // initial value in the state
  @override
  Set<Product> build() {
    // return the Notifier<Set<Product>> -> set of product as initial value
    return {
      // remove the instance of Product make it empty
      // const Product(
      //   id: '4',
      //   title: 'Red Backpack',
      //   price: 14,
      //   image: 'assets/products/backpack.png',
      // ),
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
//-------------------------------------------------------------------------code--------------------------
/**final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(
    () {
    //return instance of your Notifier
    return CartNotifier();
    },
    );
 **/

//------------------------------------------------------------------------------------------------------
// to use generated notifier
// 1- remove the provider -> NotifierProvider that we create
// 2- add @riverpod annotation -> @riverpod above the class
// 3- remove the NotifierProvider that we inherit from it
// 4- instead of NotifierProvider -> add _$SameNameOfClass that we generated
// 5- remove the value from initial value and return it empty
// 6- add part file name .g.dart
// 7- add this command:
//
