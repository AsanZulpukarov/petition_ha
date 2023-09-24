import 'dart:convert';

import 'package:petition_ha/pages/qa_screen/data/law_model.dart';

import '../../../service/api_service.dart';

Future<ListLawsModel> fetchLaws(int id) async {
  ListLawsModel listPetitionModel = ListLawsModel();
  if (listPetitionModel.data == null || listPetitionModel.data!.isEmpty) {
    final response = await ApiService().getListLaws(id);
    listPetitionModel = ListLawsModel.fromJson(jsonDecode(response));
  }
  return listPetitionModel;
}
