import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorWidget extends StatefulWidget {
  const VendorWidget({super.key});

  @override
  State<VendorWidget> createState() => _VendorWidgetState();
}

class _VendorWidgetState extends State<VendorWidget> {
  final Stream<QuerySnapshot> _vendorsStream =
      FirebaseFirestore.instance.collection('vendors').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _vendorsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (context, index) {
            final userData = snapshot.data?.docs[index];
            final FirebaseFirestore store = FirebaseFirestore.instance;
            return Row(
              children: [
                vendorData(
                  1,
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(userData?['storeImage']),
                  ),
                ),
                vendorData(
                  3,
                  Text(
                    userData?['businessName'],
                  ),
                ),
                vendorData(
                  2,
                  Text(
                    userData?['cityValue'],
                  ),
                ),
                vendorData(
                  2,
                  Text(
                    userData?['stateValue'],
                  ),
                ),
                vendorData(
                  1,
                  userData?['approved'] == true
                      ? ElevatedButton(
                          onPressed: () async {
                            await store
                                .collection("vendors")
                                .doc(userData?['vendorId'])
                                .update({
                              'approved': false,
                            });
                          },
                          child: const Text("Reject"),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            await store
                                .collection("vendors")
                                .doc(userData?['vendorId'])
                                .update({
                              'approved': true,
                            });
                          },
                          child: const Text("Approve"),
                        ),
                ),
                vendorData(
                  1,
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("View more"),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    Row(
      children: [
        vendorData(
          1,
          SizedBox(
            height: 50,
            width: 50,
            child: Image.network(""),
          ),
        ),
        vendorData(3, const Text("Huy Store ")),
        vendorData(2, const Text("City ")),
        vendorData(1, ElevatedButton(onPressed: () {}, child: Text("Reject"))),
        vendorData(
            1, ElevatedButton(onPressed: () {}, child: Text("View more"))),
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
