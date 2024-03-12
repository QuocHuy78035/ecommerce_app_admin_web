import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_web/views/screens/side_bar_screen/widgets/category_widget.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoryScreen extends StatefulWidget {
  static const String routerName = "CategoryScreen";

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late String cateName = '';
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

  uploadCategoryToStorage(dynamic image) async {
    Reference ref =
        _firebaseStorage.ref().child("categoryImages").child(fileName);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String dowUrl = await snapshot.ref.getDownloadURL();
    return dowUrl;
  }

  uploadToFirebaseStore() async {
    if (_key.currentState!.validate()) {
      EasyLoading.show();
      if (image != null) {
        String imageUrl = await uploadCategoryToStorage(image);
        await _firebaseFirestore
            .collection("categories")
            .doc(fileName)
            .set({'image': imageUrl, 'categoryName': cateName}).whenComplete(
          () {
            EasyLoading.dismiss();
            if (mounted) {
              setState(() {
                image = null;
                _key.currentState?.reset();
              });
            }
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Categories",
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
                          ? const Center(
                              child: Text(
                                "Category",
                              ),
                            )
                          : Image.memory(
                              image,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter category name";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        cateName = value;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter category name",
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
              ),
              const Divider(
                color: Colors.grey,
              ),
              const Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const CategoryWidget()
            ],
          ),
        ),
      ),
    );
  }
}
