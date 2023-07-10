import 'package:flutter/material.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Colors.black,
          fontFamily: 'LilitaOne',
          fontWeight: FontWeight.bold),
    );
  }
}
