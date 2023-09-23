import 'package:flutter/material.dart';

class MyScaffoldWidget extends StatelessWidget {
  const MyScaffoldWidget({Key? key, required this.body, this.title})
      : super(key: key);
  final Widget body;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: BackgroundView(
              size: 150,
              color: Colors.green,
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: BackgroundView(),
          ),
          Center(child: body),
        ],
      ),
    );
  }
}

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
