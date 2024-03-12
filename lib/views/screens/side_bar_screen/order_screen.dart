import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  static const String routerName = "OrderScreen";

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
                "Management Orders",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                _rowHeader("IMAGE", 1),
                _rowHeader("FULL NAME", 3),
                _rowHeader("CITY", 2),
                _rowHeader("STATE", 2),
                _rowHeader("ACTION", 1),
                _rowHeader("VIEW MORE", 1),
              ],
            )
          ],
        ),
      ),
    );
  }
}
