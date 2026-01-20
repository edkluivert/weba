import 'package:flutter/material.dart';
import 'package:weba/widgets/hover_scale.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/widgets/responsive_container.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return ResponsiveContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Section
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Why\nChoosing Us',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold, height: 1.2),
                    ),
                  ),
                  // Features Grid
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FeatureItem(
                          title: 'Luxury facilities',
                          description:
                              'The advantage of hiring a workspace with us is that givees you comfortable service and all-around facilities.',
                        ),
                        _FeatureItem(
                          title: 'Affordable Price',
                          description:
                              'You can get a workspace of the highst quality at an affordable price and still enjoy the facilities that are only here.',
                        ),
                        _FeatureItem(
                          title: 'Many Choices',
                          description:
                              'We provide many unique work space choices so that you can choose the workspace to your liking.',
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Choosing Us',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _FeatureItem(
                    title: 'Luxury facilities',
                    description:
                        'The advantage of hiring a workspace with us is that givees you comfortable service and all-around facilities.',
                  ),
                  const SizedBox(height: 24),
                  _FeatureItem(
                    title: 'Affordable Price',
                    description:
                        'You can get a workspace of the highst quality at an affordable price and still enjoy the facilities that are only here.',
                  ),
                  const SizedBox(height: 24),
                  _FeatureItem(
                    title: 'Many Choices',
                    description:
                        'We provide many unique work space choices so that you can choose the workspace to your liking.',
                  ),
                ],
              ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const _FeatureItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    // On desktop, we want these to share width. On mobile, full width.
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Expanded(
      flex: isDesktop ? 1 : 0,
      child: HoverScale(
        child: Container(
          padding: const EdgeInsets.only(right: 24.0),
          // If not desktop (column layout), we don't need Expanded behavior effectively
          // but since we are inside a Row in desktop and Column in mobile, we handle parent.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
