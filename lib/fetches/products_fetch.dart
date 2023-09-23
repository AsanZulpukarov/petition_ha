import 'dart:convert';
import '../model/productModel.dart';
import '../service/api_service.dart';

Future<ListProductsModel> fetchProducts() async {
  final response = await ApiService().getProducts();

    return ListProductsModel.fromJson(jsonDecode(response));
}
