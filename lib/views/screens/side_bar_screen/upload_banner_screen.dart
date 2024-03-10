import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String routerName = "UploadBannerScreen";

  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  dynamic image;
  late String fileName = '';

  pickImage() async {
    FilePickerResult? result = await FilePickerWeb.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result != null) {
      setState(() {
        image = result.files.single.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  uploadBannerToStorage(dynamic image) async {
    Reference ref = _firebaseStorage.ref().child("Banners").child(fileName);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String dowUrl = await snapshot.ref.getDownloadURL();
    return dowUrl;
  }

  uploadToFirebaseStore() async {
    EasyLoading.show();
    if (image != null) {
      String imageUrl = await uploadBannerToStorage(image);
      await _firebaseFirestore
          .collection("banners")
          .doc(fileName)
          .set({'image': imageUrl}).whenComplete(
        () {
          EasyLoading.dismiss();
          if (mounted) {
            setState(() {
              image = null;
            });
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Banners",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade500),
                    child: image == null
                        ? const Center(child: Text("Banner"))
                        : Image.memory(
                            image,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    uploadToFirebaseStore();
                  },
                  child: const Text("Save"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text("Upload Image"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
