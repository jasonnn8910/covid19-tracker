import 'package:flutter/material.dart';
import 'screens/screen.dart';
import 'router/router.dart' as routes;
import 'services/navigation.dart';
import 'themes/styling.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Covid19HospitalTrackerApp(),
  );
}

class Covid19HospitalTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.instance.navigationKey,
        title: 'COVID-19 Hospital Tracker',
        home: LoginScreen(),
        theme: AppTheme.lightTheme,
        onGenerateRoute: routes.generateRoute,
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => ErrorScreen())
    );
  }
}