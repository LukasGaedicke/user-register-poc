import 'package:flutter/material.dart';
import 'package:user_registration/resources/strings.dart';
import 'package:user_registration/routes.dart';
import 'firebase_options.dart';
import 'package:user_registration/presentation/pages/cover_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Strings.userRegistration,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
        home: const CoverPage());
  }
}
