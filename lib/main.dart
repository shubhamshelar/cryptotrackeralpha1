import 'package:email_password_login/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Constants/Themes.dart';
import 'Providers/Chart_provider.dart';
import 'Providers/Theme_provider.dart';
import 'Providers/marketprovider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Marketprovider>(
          create: (context) => Marketprovider(),
        ),
        ChangeNotifierProvider<GraphProvider>(
          create: (context) => GraphProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider("light"),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode : themeProvider.themeMode,
            theme: lightTheme,
            darkTheme: darktheme,
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
//   }
// }


// MaterialApp(
// title: 'Email And Password Login',
// theme: ThemeData(
// primarySwatch: Colors.red,
// ),
// debugShowCheckedModeBanner: false,
// home: LoginScreen(),
// );