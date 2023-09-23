import 'dart:convert';



import '../model/productModel.dart';
import '../service/api_service.dart';

Future<ListProductsModel> fetchProfileProducts(String email) async {
  final response = await ApiService().getProfileProducts(email);

    return ListProductsModel.fromJson(jsonDecode(response));
}
