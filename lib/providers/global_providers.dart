//Packages
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//User Model
import '../models/product.dart';

//User Service
import '../services/product_service.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService(Dio());
});

final productFutureProvider = FutureProvider.autoDispose<List<Product>>((ref) async {
  //we use autoDispose to reset the state when the user leaves the screen and re-enters it.
  ref.maintainState = true;
  //if the request failed and the user leaves the screen then re-enters it, then the request will be performed again
  final productService = ref.watch(productServiceProvider);
  final products = await productService.getProducts();
  return products;
});


final productsFutureProvider = FutureProvider.autoDispose((ref) async {
  return ;
});
