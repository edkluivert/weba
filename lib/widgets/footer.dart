import 'package:flutter/material.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/widgets/responsive_container.dart';
import 'package:weba/widgets/hover_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface, // Or a light grey
      padding: const EdgeInsets.only(top: 80, bottom: 40),
      width: double.infinity,
      child: ResponsiveContainer(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand Column
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Panto',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'The advantage of hiring a workspace with us is that givees you comfortable service and all-around facilities.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                if (MediaQuery.of(context).size.width > 600) ...[
                  const SizedBox(width: 40),
                  // Services
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Services', style: _headerStyle),
                        const SizedBox(height: 20),
                        HoverText('Email Marketing', style: _itemStyle),
                        const SizedBox(height: 12),
                        HoverText('Campaigns', style: _itemStyle),
                        const SizedBox(height: 12),
                        HoverText('Branding', style: _itemStyle),
                      ],
                    ),
                  ),
                  // Furniture
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Furniture', style: _headerStyle),
                        const SizedBox(height: 20),
                        HoverText('Beds', style: _itemStyle),
                        const SizedBox(height: 12),
                        HoverText('Chair', style: _itemStyle),
                        const SizedBox(height: 12),
                        HoverText('All', style: _itemStyle),
                      ],
                    ),
                  ),
                  // Follow Us
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Follow Us', style: _headerStyle),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.facebook, color: AppColors.textPrimary),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.camera_alt,
                              color: AppColors.textPrimary,
                            ), // Instagram surrogate
                            const SizedBox(width: 16),
                            Icon(
                              Icons.alternate_email,
                              color: AppColors.textPrimary,
                            ), // Twitter surrogate
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Copyright © 2021',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Row(
                  children: [
                    HoverText('Terms & Conditions', style: _policyStyle),
                    const SizedBox(width: 24),
                    HoverText('Privacy Policy', style: _policyStyle),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _headerStyle =>
      const TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondary);

  TextStyle get _itemStyle => const TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );

  TextStyle get _policyStyle =>
      const TextStyle(color: AppColors.textSecondary, fontSize: 12);
}
