import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/wrapper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const HomzApp());
}

class HomzApp extends StatelessWidget {
  const HomzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Homz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: kOffBlack),
        ),
      ),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
      home: const Wrapper(),

    );
  }
}
