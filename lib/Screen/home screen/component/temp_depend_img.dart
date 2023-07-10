import 'package:flutter/material.dart';

class TopTempDependImg extends StatelessWidget {
  const TopTempDependImg({
    super.key,
    required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        img,
        height: 200,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
