import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class StaticVote extends StatelessWidget {
  const StaticVote({Key? key, required this.currentVote}) : super(key: key);
  final int currentVote;
  final int maxVote = 10000;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 30,
      child: Row(
        children: [
          Flexible(
            flex: currentVote,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(15)),
              ),
            ),
          ),
          Flexible(
            flex: maxVote,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(15),
                  left: currentVote <= 10 ? Radius.circular(15) : Radius.zero,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
