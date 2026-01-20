import 'package:flutter/material.dart';
import 'package:weba/constants/assets.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/widgets/responsive_container.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return ResponsiveContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: isDesktop
            ? Row(
                children: [
                  // Image (Left)
                  Expanded(child: _ExperienceImage()),
                  const SizedBox(width: 60),
                  // Content (Right)
                  Expanded(child: _ExperienceContent()),
                ],
              )
            : Column(
                children: [
                  _ExperienceImage(),
                  const SizedBox(height: 48),
                  _ExperienceContent(),
                ],
              ),
      ),
    );
  }
}

class _ExperienceImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Image
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(0), // Designed corner
          ),
          child: Image.network(
            AppAssets.experienceImage,
            height: 450,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        // Overlapping stylized elements could be added here
      ],
    );
  }
}

class _ExperienceContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXPERIENCES',
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'We Provide You The\nBest Experience',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'You don\'t have to worry about the result because all of these interiors are made by people who are professionals in their fields with an elegant and lucurious style and with premium quality materials',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'More Info',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: AppColors.secondary, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
