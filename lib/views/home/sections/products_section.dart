import 'package:flutter/material.dart';
import 'package:weba/constants/assets.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/widgets/product_card.dart';
import 'package:weba/widgets/responsive_container.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  int _selectedIndex = 0;
  final List<String> _categories = ['Chair', 'Beds', 'Sofa', 'Lamp'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            // Header
            Text(
              'Best Selling Product',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            // Category Tabs
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(_categories.length, (index) {
                  return _CategoryTab(
                    title: _categories[index],
                    isSelected: _selectedIndex == index,
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                }),
              ),
            ),
            const SizedBox(height: 48),

            // Products Grid
            LayoutBuilder(
              builder: (context, constraints) {
                // Responsive grid columns
                int crossAxisCount = 4;
                if (constraints.maxWidth < 600) {
                  crossAxisCount = 1;
                } else if (constraints.maxWidth < 900) {
                  crossAxisCount = 2;
                } else if (constraints.maxWidth < 1200) {
                  crossAxisCount = 3;
                }

                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  children: const [
                    ProductCard(
                      image: AppAssets.chair1,
                      category: 'Chair',
                      title: 'Sakarias Armchair',
                      price: '392',
                      rating: 5.0,
                    ),
                    ProductCard(
                      image: AppAssets.chair2,
                      category: 'Chair',
                      title: 'Baltsar Chair',
                      price: '299',
                      rating: 5.0,
                    ),
                    ProductCard(
                      image: AppAssets.chair3,
                      category: 'Chair',
                      title: 'Anjay Chair',
                      price: '519',
                      rating: 5.0,
                    ),
                    ProductCard(
                      image: AppAssets.chair4,
                      category: 'Chair',
                      title: 'Nyantuy Chair',
                      price: '921',
                      rating: 5.0,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 48),

            // View All Link
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.secondary,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryTab({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
