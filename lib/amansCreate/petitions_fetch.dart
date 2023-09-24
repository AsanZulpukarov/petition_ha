import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:petition_ha/amansCreate/service_aman.dart';
import 'package:petition_ha/amansCreate/petitionsModel.dart';



import '../model/categoriesModel.dart';
import '../model/productModel.dart';
import '../service/api_service.dart';

Future<PetitionsModel> fetchPetitions() async {
  final response = await ServiceAman().getPetitions();

  return PetitionsModel.fromJson(jsonDecode(response));
}
