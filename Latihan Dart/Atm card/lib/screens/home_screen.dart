import 'package:flutter/material.dart';
import 'package:flutter_application_4/Models/transaction.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Mate'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 249, 36),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Title =====
            const Text(
              'My Cards',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ===== Banner Cards =====
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank BNI',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    ownerName: 'Fany Milani',
                    color1: Color.fromARGB(255, 0, 255, 0),
                    color2: Color.fromARGB(255, 245, 245, 244),
                    logo: 'assets/images/bni.png',
                  ),
                  AtmCard(
                    bankName: 'DANA',
                    cardNumber: '**** 8765',
                    balance: 'Rp5.350.000',
                    ownerName: 'Fany Milani',
                    color1: Color.fromARGB(255, 0, 255, 0),
                    color2: Color.fromARGB(255, 241, 243, 240),
                    logo: 'assets/images/dana.png',
                  ),
                  AtmCard(
                    bankName: 'Bank BRI',
                    cardNumber: '**** 1122',
                    balance: 'Rp8.750.000',
                    ownerName: 'Fany Milani',
                    color1: Color.fromARGB(255, 0, 255, 0),
                    color2: Color.fromARGB(255, 255, 255, 255),
                    logo: 'assets/images/bri.png',
                  ),
                  AtmCard(
                    bankName: 'Bank Mandiri',
                    cardNumber: '**** 9988',
                    balance: 'Rp3.200.000',
                    ownerName: 'Fany Milani',
                    color1: Color.fromARGB(255, 45, 247, 0),
                    color2: Color.fromARGB(255, 255, 255, 255),
                    logo: 'assets/images/mandiri.png',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Grid Menu =====
            const Text(
              'Menu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 8, // tampil 4 item per baris
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GridMenuItem(icon: Icons.health_and_safety, label: 'Health'),
                GridMenuItem(icon: Icons.travel_explore, label: 'Travel'),
                GridMenuItem(icon: Icons.fastfood, label: 'Food'),
                GridMenuItem(icon: Icons.event, label: 'Event'),
                GridMenuItem(icon: Icons.shopping_bag, label: 'Shopping'),
                GridMenuItem(icon: Icons.savings, label: 'Savings'),
                GridMenuItem(icon: Icons.credit_card, label: 'Bills'),
                GridMenuItem(icon: Icons.attach_money, label: 'Income'),
              ],
            ),

            const SizedBox(height: 24),

            // ===== Transaction List =====
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
