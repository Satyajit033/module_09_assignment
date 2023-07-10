import 'package:flutter/material.dart';

class TempShowCard extends StatelessWidget {
  const TempShowCard({
    Key? key,
    required this.img,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  }) : super(key: key);
  final String img;
  final String temp;
  final String maxTemp;
  final String minTemp;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Image.network(
              img,
              height: 100,
              width: 100,
            ),
            const Spacer(),
            Text(temp,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    )),
            const Spacer(),
            Column(
              children: [
                Text(
                  maxTemp,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  minTemp,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
