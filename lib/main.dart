import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_help/core/routes/router.dart';
import 'package:get_help/presentation/auth/auth_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'CUET Get Help',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blueGrey,
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.white),
                ),
              ),
              fixedSize: MaterialStateProperty.all<Size>(const Size(350, 80)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
              backgroundColor:
                  const MaterialStatePropertyAll<Color>(Colors.white),
            ),
          ),
          scaffoldBackgroundColor: Colors.transparent,
        ),
        routerConfig: router,
      ),
    );
  }
}
