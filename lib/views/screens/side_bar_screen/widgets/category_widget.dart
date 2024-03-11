import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _cateStream =
    FirebaseFirestore.instance.collection("categories").snapshots();
    return StreamBuilder(
      stream: _cateStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Some thing is wrong"),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.size,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              final cateData = snapshot.data?.docs[index];
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(cateData?['image']),
                  ),
                  Text(cateData?['categoryName'])
                ],
              );
            },
          );
        }
      },
    );
  }
}
