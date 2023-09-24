import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({Key? key, this.size = 100, this.color = Colors.blue})
      : super(key: key);

  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 220,
            spreadRadius: 30,
          ),
        ],
      ),
    );
  }
}
