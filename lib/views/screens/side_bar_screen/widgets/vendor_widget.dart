import 'package:flutter/material.dart';

class VendorWidget extends StatelessWidget {
  const VendorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        vendorData(
          1,
          SizedBox(
            height: 50,
            width: 50,
            child: Image.network(""),
          ),
        ),
        vendorData(
          3,
          const Text("Huy Store ")
        ),
        vendorData(
            2,
            const Text("City ")
        ),
        vendorData(
            1,
            ElevatedButton(onPressed: (){}, child: Text("Reject"))
        ),
        vendorData(
            1,
            ElevatedButton(onPressed: (){}, child: Text("View more"))
        ),
      ],
    );
  }

  Widget vendorData(int? flex, Widget widget) {
    return Expanded(
      flex: flex ?? 0,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: widget,
      ),
    );
  }
}
