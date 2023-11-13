import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:petition_ha/amansCreate/service_aman.dart';
import 'package:petition_ha/amansCreate/petitionsModel.dart';

import '../model/categoriesModel.dart';
import '../model/productModel.dart';
import '../service/api_service.dart';

Future<PetitionsModel> fetchPetitions() async {
  // final response = await ServiceAman().getPetitions();
  var json = {
    "data": [
      {"id": 1, "ruTitle": "123", "ruDescription": "12"},
      {"id": 2, "ruTitle": "test", "ruDescription": "test"},
      {"id": 3, "ruTitle": "test", "ruDescription": "test"}
    ]
  };
  return PetitionsModel.fromJson(json);
}
