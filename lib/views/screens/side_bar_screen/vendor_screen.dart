import 'package:ecommerce_admin_web/views/screens/side_bar_screen/widgets/vendor_widget.dart';
import 'package:flutter/material.dart';

class VendorScreen extends StatefulWidget {
  static const String routerName = "\VendorScreen";

  const VendorScreen({super.key});

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
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
                "Manage Vendors",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                _rowHeader("LOGO", 1),
                _rowHeader("BUSINESS NAME", 3),
                _rowHeader("CITY", 2),
                _rowHeader("STATE", 2),
                _rowHeader("ACTION", 1),
                _rowHeader("VIEW MORE", 1),
              ],
            ),
            VendorWidget()
          ],
        ),
      ),
    );
  }
}
