import 'package:flutter/material.dart';
import 'package:petition_ha/widgets/comment_item.dart';

import 'fetch/fetch_comment.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key, required this.idPetition}) : super(key: key);
  final int idPetition;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchComment(idPetition),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.data!.isEmpty) {
              return const Center(
                child: Text("Комментариев нет"),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.data?.length,
                itemBuilder: (context, index) {
                  return CommentItem(
                      comment: snapshot.data!.data!.elementAt(index));
                });
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Ошибка"),
            );
          }
        });
  }
}
