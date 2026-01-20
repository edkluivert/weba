import 'package:flutter/material.dart';
import 'package:weba/constants/assets.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/widgets/responsive_container.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MaterialsSection extends StatelessWidget {
  const MaterialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    Widget textContent = Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Materials',
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Very Serious Materials For Making Furniture',
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            'Because panto was very serious about designing furniture for our environment, using a very expensive and famous capital but at a relatively low price',
            textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
          ),
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

    Widget gridContent = StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1, // Reduced height for smoother layout
          child: _MaterialCard(image: AppAssets.material1),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: _MaterialCard(image: AppAssets.material2),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3, // Full width bottom item
          mainAxisCellCount: 1,
          child: _MaterialCard(image: AppAssets.material3),
        ),
      ],
    );

    return ResponsiveContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: isDesktop
            ? Row(
                children: [
                  Expanded(flex: 2, child: textContent),
                  const SizedBox(width: 40),
                  Expanded(flex: 3, child: gridContent),
                ],
              )
            : Column(
                children: [
                  textContent,
                  const SizedBox(height: 48),
                  gridContent,
                ],
              ),
      ),
    );
  }
}

class _MaterialCard extends StatelessWidget {
  final String image;

  const _MaterialCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(image, fit: BoxFit.cover),
    );
  }
}
