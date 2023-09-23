import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:petition_ha/service/api_service.dart';


import '../model/aboutProductModel.dart';
import '../model/productModel.dart';

Future<AboutProductModel> fetchProductData(String productId,String email) async {
  final response = await ApiService().getProductData(productId,email);

  return AboutProductModel.fromJson(jsonDecode(response));
}
