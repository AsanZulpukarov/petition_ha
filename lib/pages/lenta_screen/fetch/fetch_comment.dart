import 'dart:convert';

import '../../../model/list_comment_model.dart';
import '../../../service/api_service.dart';

Future<ListCommentModel> fetchComment(int idPetition) async {
  int id = -1;
  ListCommentModel listCommentModel = ListCommentModel();
  if (listCommentModel.data == null ||
      listCommentModel.data!.isEmpty ||
      id != idPetition) {
    final response = await ApiService().getListComment(idPetition);
    listCommentModel = ListCommentModel.fromJson(jsonDecode(response));
    id = idPetition;
  }
  return listCommentModel;
}
