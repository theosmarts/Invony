import 'package:dio/dio.dart';
import 'package:invony/env/env.dart';
import 'package:invony/exceptions/custom_exception.dart';
import 'package:invony/models/product.dart';

class ProductService {
  ProductService(this._dio);

  final Dio _dio;

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get(allProductsLink);

      final results = List<Map<String, dynamic>>.from(response.data);

      List<Product> allProducts = results
          .map((userData) => Product.fromJson(userData))
          .toList(growable: false);

      return allProducts;
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    }
  }
}
