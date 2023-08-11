import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiko/constrants/global_variable.dart';
import 'package:tiko/features/admin/screens/adminScreen.dart';
import 'package:tiko/features/auth/screens/auth_screen.dart';
import 'package:tiko/features/home/screen/home.dart';
import 'package:tiko/router.dart';
import 'package:tiko/widgets/bottom_bar.dart';

import 'provider/user_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amma Jaan',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen());
  }
}
