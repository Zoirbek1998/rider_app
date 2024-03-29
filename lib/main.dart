import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:rider_app/provider/all_screens/login_screen.dart';
import 'package:rider_app/provider/all_screens/main_screen/main_screen.dart';
import 'package:rider_app/provider/all_screens/register_screen.dart';
import 'package:rider_app/provider/all_screens/search/search_page.dart';
import 'package:rider_app/provider/data_handler/app_data.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(const BlocMyApp());
  runApp(const ProviderMyApp());
}
/// Provider MyApp

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");

class ProviderMyApp extends StatelessWidget {
  const ProviderMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AppData(),
      child: MaterialApp(
        title: 'Taxi Rider App',
        theme: ThemeData(
          fontFamily: "med",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:const AppBarTheme(
            backgroundColor: Colors.white
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: MainScreen.routeName,
        routes: {
          LoginScreen.routeName:(context) => LoginScreen(),
          RegisterScreen.routeName:(context) => RegisterScreen(),
          MainScreen.routeName:(context) =>const MainScreen(),
          SearchPage.routeName:(context) =>const SearchPage(),
        },
      ),
    );
  }
}
