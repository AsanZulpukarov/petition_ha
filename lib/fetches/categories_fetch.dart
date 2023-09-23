import 'dart:convert';


import 'package:http/http.dart' as http;



import '../model/categoriesModel.dart';
import '../model/productModel.dart';
import '../service/api_service.dart';

Future<CategoriesModel> fetchCategories() async {
  final response = await ApiService().getCategories();

    return CategoriesModel.fromJson(jsonDecode(response));
}
