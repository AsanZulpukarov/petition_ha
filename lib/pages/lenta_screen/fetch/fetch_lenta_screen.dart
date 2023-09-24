import 'dart:convert';

import 'package:petition_ha/service/api_service.dart';

import '../../../model/petition_model.dart';

Future<ListPetitionModel> fetchLentaScreen() async {
  ListPetitionModel listPetitionModel = ListPetitionModel();
  if (listPetitionModel.data == null || listPetitionModel.data!.isEmpty) {
    final response = await ApiService().getListPetition();
    listPetitionModel = ListPetitionModel.fromJson(jsonDecode(response));
  }
  return listPetitionModel;
}
