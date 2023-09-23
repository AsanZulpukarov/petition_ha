import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
