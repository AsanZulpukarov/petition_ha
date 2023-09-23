import 'dart:convert';



import '../model/productModel.dart';
import '../service/api_service.dart';

Future<ListProductsModel> fetchProductsFavorite(String email) async {
  final response = await ApiService().getProductsFavorite(email);

    return ListProductsModel.fromJson(jsonDecode(response));
}
