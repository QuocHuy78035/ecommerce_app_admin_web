import 'package:flutter/material.dart';

class WidthdrawalScreen extends StatefulWidget {
  static const String routerName = "WidthdrawalScreen";

  const WidthdrawalScreen({super.key});

  @override
  State<WidthdrawalScreen> createState() => _WidthdrawalScreenState();
}

class _WidthdrawalScreenState extends State<WidthdrawalScreen> {
  Widget _rowHeader(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade700),
            color: Colors.yellow.shade900),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "WithDrawal",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                _rowHeader("NAME", 1),
                _rowHeader("AMOUNT", 3),
                _rowHeader("BANK NAME", 2),
                _rowHeader("BANK ACCOUNT", 2),
                _rowHeader("EMAIL", 1),
                _rowHeader("PHONE", 1),
              ],
            )
          ],
        ),
      ),
    );
  }
}
