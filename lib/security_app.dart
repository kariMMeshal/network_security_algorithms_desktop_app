import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors_manager.dart';

class SecurityApp extends StatelessWidget {
  const SecurityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netwrok Security',
      initialRoute: Routes.homeScreen,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.mainBlue,
        textTheme: GoogleFonts.robotoMonoTextTheme(),
      ),
    );
  }
}
