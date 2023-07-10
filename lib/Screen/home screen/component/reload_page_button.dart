import 'package:flutter/material.dart';

class ReloadPageButton extends StatelessWidget {
  const ReloadPageButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: const Icon(Icons.refresh));
  }
}
