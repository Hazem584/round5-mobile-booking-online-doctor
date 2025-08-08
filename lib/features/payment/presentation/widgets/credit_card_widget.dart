import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xff19D9C2), Color(0xff3B58E7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Spenny",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text("VISA", style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
          const Spacer(),
          const Text(
            "6789 4567 5432 8903",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Seif Mohamed", style: TextStyle(color: Colors.white)),
              Text("12/22", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
