import 'dart:convert';

import '../../../service/api_service.dart';
import '../data/section_model.dart';

Future<ListSectionModel> fetchSection(int id) async {
  ListSectionModel listPetitionModel = ListSectionModel();
  if (listPetitionModel.data == null || listPetitionModel.data!.isEmpty) {
    final response = await ApiService().getListSection(id);
    listPetitionModel = ListSectionModel.fromJson(jsonDecode(response));
  }
  return listPetitionModel;
}
