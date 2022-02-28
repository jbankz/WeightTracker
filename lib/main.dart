import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/views/presentation/provider/weight_provider.dart';

import 'core/di/injector.dart';
import 'core/helper/configs/providers.dart';
import 'views/presentation/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeCore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: Providers.getProviders,
        child: MaterialApp(
            title: 'UPass',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.blue),
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (x, snapshot) {
                if (snapshot.hasData) {
                  return const FirstScreen();
                }
                return Scaffold(
                  body: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Provider.of<WeightProvider>(x, listen: false)
                              .authenticateUser();
                        },
                        child: const Text('Anonymous Sign In')),
                  ),
                );
              },
            )));
  }
}
