import 'package:flutter/material.dart';
import 'package:weba/constants/assets.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/widgets/responsive_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Container(
      width: double.infinity,
      // Stack content on top of background image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(AppAssets.heroImage),
          fit: BoxFit.cover,
          // Darken the image slightly so text pops
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
        ),
      ),
      child: ResponsiveContainer(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 140.0,
            bottom: 100.0,
          ), // Added top padding for NavBar
          child: Column(
            children: [
              // Headline
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isDesktop ? 600 : 700),
                child: Text(
                  'Make Your Interior More Minimalistic & Modern',
                  textAlign: TextAlign
                      .center, // Always center as requested/implied for text field
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Subtitle
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isDesktop ? 500 : 600),
                child: Text(
                  'Turn your room with panto into a lot more minimalist and modern with ease and speed',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Search Bar (Functional & Centered)
              Center(
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(
                    4,
                  ), // Reduced padding to let TextField fill space
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Search furniture...',
                      hintStyle: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 2), // Tiny margin
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            // TODO: Implement search
                          },
                        ),
                      ),
                    ),
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
