import 'dart:convert';
import '../model/productModel.dart';
import '../service/api_service.dart';

Future<ListProductsModel> fetchSearchProducts(String search) async {
  final response = await ApiService().getSearchProducts(search);

  return ListProductsModel.fromJson(jsonDecode(response));
}
