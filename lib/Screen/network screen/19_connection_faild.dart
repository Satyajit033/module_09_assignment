import 'package:flutter/material.dart';

class ConnectionFaildScreen extends StatelessWidget {
  const ConnectionFaildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/19_Error.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 13),
                    blurRadius: 25,
                    color: const Color(0xFF5666C2).withOpacity(0.17),
                  ),
                ],
              ),
              child: MaterialButton(
                color: const Color(0xFF68C581),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {},
                child: Text(
                  "retry".toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
