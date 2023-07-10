import 'package:flutter/material.dart';

class UpdateTime extends StatelessWidget {
  const UpdateTime({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.black,
          ),
    );
  }
}
