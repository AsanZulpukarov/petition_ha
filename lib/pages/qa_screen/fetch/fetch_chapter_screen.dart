import 'dart:convert';

import '../../../service/api_service.dart';
import '../data/chapter_model.dart';

Future<ListChapterModel> fetchChapter(int id) async {
  ListChapterModel listPetitionModel = ListChapterModel();
  if (listPetitionModel.data == null || listPetitionModel.data!.isEmpty) {
    final response = await ApiService().getListChapter(id);
    listPetitionModel = ListChapterModel.fromJson(jsonDecode(response));
  }
  return listPetitionModel;
}
