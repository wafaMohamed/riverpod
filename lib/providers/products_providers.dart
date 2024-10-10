// Provider is a main building block ( Central Place )
// State
 import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product.dart';
part 'products_providers.g.dart';

const List<Product> allProducts = [
  Product(
      id: '1',
      title: 'Groovy Shorts',
      price: 12,
      image: 'assets/products/shorts.png'),
  Product(
      id: '2',
      title: 'Karati Kit',
      price: 34,
      image: 'assets/products/karati.png'),
  Product(
      id: '3',
      title: 'Denim Jeans',
      price: 54,
      image: 'assets/products/jeans.png'),
  Product(
      id: '4',
      title: 'Red Backpack',
      price: 14,
      image: 'assets/products/backpack.png'),
  Product(
      id: '5',
      title: 'Drum & Sticks',
      price: 29,
      image: 'assets/products/drum.png'),
  Product(
      id: '6',
      title: 'Blue Suitcase',
      price: 44,
      image: 'assets/products/suitcase.png'),
  Product(
      id: '7',
      title: 'Roller Skates',
      price: 52,
      image: 'assets/products/skates.png'),
  Product(
      id: '8',
      title: 'Electric Guitar',
      price: 79,
      image: 'assets/products/guitar.png'),
];



/** generated provider
add build_runner package
 flutter pub run build_runner build
 then add part file name .g.dart
 put this command:
 dart run build_runner watch **/
/**
 @riverpod
    // import the annotation package it's inclue the riverpod also
    // put the return type of state value
    // add ref parameter -> refer to the ref of  state value
    // return the state value do the generating file
 **/
@riverpod
List<Product> products ( ref){
   return allProducts;
}
@riverpod
List<Product> reducedProducts (ref){
  return allProducts.where((product) => product.price < 50 ,).toList();
}