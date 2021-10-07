//Packages
import 'package:dio/dio.dart';

//Link to API
import '../env/env.dart';

//Exceptions
import '../exceptions/custom_exception.dart';

//Product Model
import '../models/product.dart';

//This service fetches all the products from the API

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
