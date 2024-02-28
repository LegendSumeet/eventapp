import 'package:event_app/app/configs/theme.dart';
import 'package:event_app/app/resources/constant/named_routes.dart';
import 'package:event_app/ui/pages/detail_page.dart';
import 'package:event_app/ui/pages/home_page.dart';
import 'package:event_app/ui/pages/ticket_page.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:event_app/auth/phoneauth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case NamedRoutes.homeScreen:
            return MaterialPageRoute(builder: (context) => HomePage());
          case NamedRoutes.detailScreen:
            return MaterialPageRoute(
              builder: (_) => const DetailPage(),
              settings: settings,
            );
          case NamedRoutes.ticketScreen:
            return MaterialPageRoute(
              builder: (context) => const TicketPage(),
              settings: settings,
            );
          default:
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
      home: PhoneAuth());
  }
}
