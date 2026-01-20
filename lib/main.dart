import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/views/home/home_view.dart';

void main() {
  runApp(const WebaApp());
}

class WebaApp extends StatelessWidget {
  const WebaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weba Furniture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
          // background is deprecated, surface covers it
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(
              bodyColor: AppColors.textPrimary,
              displayColor: AppColors.textPrimary,
            ),
      ),
      home: const SelectionArea(child: HomeView()),
    );
  }
}
