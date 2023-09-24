import 'package:flutter/material.dart';
import 'package:petition_ha/shared/app_text_styles.dart';

import '../model/list_comment_model.dart';
import '../shared/app_colors.dart';

class CommentItem extends StatefulWidget {
  const CommentItem({Key? key, required this.comment}) : super(key: key);
  final Data comment;

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.person,
              color: AppColors.blue,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.comment.user?.fullName ?? "пусто",
                    style: AppTextStyles.black12,
                  ),
                  Text(widget.comment.comment ?? "Пусто"),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (widget.comment.isMineLike == true) {
                      widget.comment.isMineLike = false;
                      widget.comment.likeCount = widget.comment.likeCount! - 1;
                    } else {
                      widget.comment.isMineLike = true;
                      widget.comment.likeCount = widget.comment.likeCount! + 1;
                    }
                    setState(() {});
                  },
                  icon: Icon(
                      widget.comment.isMineLike == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColors.mainRed),
                ),
                Text(widget.comment.likeCount.toString()),
              ],
            ),
          ],
        ));
  }
}
