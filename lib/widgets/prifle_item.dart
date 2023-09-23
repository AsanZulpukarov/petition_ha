import 'package:flutter/material.dart';

import '../../../../shared/app_colors.dart';
import '../../../../shared/app_text_styles.dart';

class ProfileItem extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final String label;

  const ProfileItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 17,
          right: 10,
          top: 12,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.white10.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(7, 7),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
            ),
            const SizedBox(width: 22),
            Expanded(
              flex: 15,
              child: Text(
                label,
                style: AppTextStyles.black18Semibold.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
