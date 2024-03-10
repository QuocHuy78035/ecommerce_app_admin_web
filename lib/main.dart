import 'package:ecommerce_admin_web/views/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

  await Firebase.initializeApp(

      options: kIsWeb || Platform.isAndroid ? const FirebaseOptions(
          apiKey: "AIzaSyA9CXrGVu6q5Kiy395hfhF7EmsGGJmiOZ4",
          authDomain: "ecommerceapp-5eb53.firebaseapp.com",
          projectId: "ecommerceapp-5eb53",
          storageBucket: "ecommerceapp-5eb53.appspot.com",
          messagingSenderId: "354062299636",
          appId: "1:354062299636:web:a7a16d43468c0b161e09a1",
          measurementId: "G-FDSDVGY7JF"
      ) : null
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}

