import 'package:flutter/material.dart';
import 'package:shop_app/screens/init_screen.dart';

class WaitingScreen extends StatelessWidget {
  static String routeName = "/waiting_screen";

  const WaitingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text(""),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(
            "assets/animations/hourglass.gif",
            height: MediaQuery.of(context).size.height * 0.3, //40%
          ),
          const SizedBox(height: 16),
          const Text(
            "Looking for a partner!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Text(
            "We're finding the perfect therapist for your session. We'll confirm within an hour! Thanks for your patience.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, InitScreen.routeName);
              },
              child: const Text(
                "Back to home",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
