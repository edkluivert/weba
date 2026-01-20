import 'package:flutter/material.dart';
import 'package:weba/widgets/nav_bar.dart';
import 'package:weba/views/home/sections/hero_section.dart';
import 'package:weba/views/home/sections/features_section.dart';
import 'package:weba/views/home/sections/products_section.dart';
import 'package:weba/views/home/sections/experience_section.dart';
import 'package:weba/views/home/sections/materials_section.dart';
import 'package:weba/views/home/sections/testimonials_section.dart';
import 'package:weba/widgets/footer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // We want the NavBar to be on top of the HeroSection.
      // Easiest way is to Stack the HeroSection (which includes the top image)
      // and the NavBar.
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const HeroSection(),
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: NavBar(isTransparent: true),
                      ),
                    ],
                  ),
                  const FeaturesSection(),
                  const SizedBox(height: 60),
                  const ProductsSection(),
                  const ExperienceSection(),
                  const MaterialsSection(),
                  const TestimonialsSection(),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
