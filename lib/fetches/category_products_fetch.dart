import 'dart:convert';


import 'package:http/http.dart' as http;
import '../model/productModel.dart';
import '../service/api_service.dart';

Future<ListProductsModel> fetchCategoryProducts(String id) async {
  final response = await ApiService().getCategoryProducts(id);

    return ListProductsModel.fromJson(jsonDecode(response));
}
