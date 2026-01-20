import 'package:flutter/material.dart';
import 'package:weba/constants/assets.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/widgets/responsive_container.dart';
import 'package:weba/widgets/hover_scale.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            // Header
            Text(
              'TESTIMONIALS',
              style: TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Our Client Reviews',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),

            // Reviews Scroll/Grid
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _ReviewCard(
                    image: AppAssets.user1,
                    name: 'Bang Upin',
                    role: 'Pedagang Asongan',
                    review:
                        'Terimakasih banyak, kini ruanganku menjadi lebih mewah dan terlihat mahal',
                    rating: 5,
                  ),
                  const SizedBox(width: 24),
                  _ReviewCard(
                    image: AppAssets.user2,
                    name: 'Ibuk Sukijan',
                    role: 'Ibu Rumah Tangga',
                    review:
                        'Makasih Panto, aku sekarang berasa tinggal di apartement karena barang-barang yang terlihat mewah',
                    rating: 5,
                  ),
                  const SizedBox(width: 24),
                  _ReviewCard(
                    image: AppAssets.user3,
                    name: 'Mpok Ina',
                    role: 'Karyawan Swasta',
                    review:
                        'Sangat terjangkau untuk kantong saya yang tidak terlalu banyak',
                    rating: 5,
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

class _ReviewCard extends StatelessWidget {
  final String image;
  final String name;
  final String role;
  final String review;
  final int rating;

  const _ReviewCard({
    required this.image,
    required this.name,
    required this.role,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Background Image Layer
              Positioned.fill(
                child: Image.network(
                  AppAssets.chair3,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.green[200]); // Fallback
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(color: Colors.grey[200]); // Loading state
                  },
                ),
              ),
              // White Overlay (to make background subtle)
              // Positioned.fill(
              //   child: Container(
              //     color: Colors.white.withValues(alpha: 0.85), // Adjust opacity here
              //   ),
              // ),
              // Content Card
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(image),
                        radius: 24,
                        backgroundColor: Colors.grey[300],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        role,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '"$review"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 14,
                            color: index < rating
                                ? AppColors.secondary
                                : Colors.grey[300],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
