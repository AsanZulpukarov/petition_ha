import 'dart:convert';

import '../../../service/api_service.dart';
import '../data/category_model.dart';

Future<ListCategoryModel> fetchCategory() async {
  ListCategoryModel listPetitionModel = ListCategoryModel();
  if (listPetitionModel.data == null || listPetitionModel.data!.isEmpty) {
    final response = await ApiService().getListCategory();
    listPetitionModel = ListCategoryModel.fromJson(jsonDecode(response));
  }
  return listPetitionModel;
}
