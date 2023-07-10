import 'package:flutter/material.dart';

class CloudOrSunny extends StatelessWidget {
  const CloudOrSunny({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
          fontFamily: 'LilitaOne',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30),
    );
  }
}
