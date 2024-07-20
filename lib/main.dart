import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product_list/firebase_options.dart';

import 'view/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BurningBrosApp());
}
