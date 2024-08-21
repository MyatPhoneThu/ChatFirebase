import 'package:chatapp/services/auth_services.dart';
import 'package:chatapp/services/navigation_service.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import './util.dart';

void main() async {
  await setup();
  runApp(ChatApp());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
  await registerServices();
}

// ignore: must_be_immutable
class ChatApp extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;

  late NavigationService _navigationService;
  late AuthServices _authServices;

  ChatApp({super.key}) {
    _navigationService = _getIt.get<NavigationService>();
    _authServices = _getIt.get<AuthServices>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationService.navigatorKey,
      title: 'ChatApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.loraTextTheme(),
      ),
      initialRoute: _authServices.user != null ? "/home" : "/login",
      routes: _navigationService.routes,
    );
  }
}
