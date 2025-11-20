import 'package:flutter/material.dart';

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String balance;
  final String ownerName;
  final Color color1;
  final Color color2;
  final String? logo; // logo opsional

  const AtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.balance,
    required this.ownerName,
    required this.color1,
    required this.color2,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Bank
          if (logo != null)
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                logo!,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),

          const SizedBox(height: 10),
          Text(
            bankName,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            cardNumber,
            style: const TextStyle(
                letterSpacing: 2, fontSize: 16, color: Colors.black87),
          ),
          const Spacer(),
          const Text(
            'Balance',
            style: TextStyle(color: Colors.black54),
          ),
          Text(
            balance,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(ownerName, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
