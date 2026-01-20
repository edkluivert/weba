import 'package:flutter/material.dart';
import 'package:weba/constants/colors.dart';
import 'package:weba/widgets/responsive_container.dart';

class NavBar extends StatelessWidget {
  final bool isTransparent;

  const NavBar({super.key, this.isTransparent = false});

  @override
  Widget build(BuildContext context) {
    final textColor = isTransparent ? Colors.white : AppColors.textPrimary;

    return Container(
      color: isTransparent ? Colors.transparent : AppColors.background,
      width: double.infinity,
      height: 80,
      child: ResponsiveContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Text(
              'Weba',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),

            // Desktop Menu
            if (MediaQuery.of(context).size.width > 800)
              Row(
                children: [
                  _NavButton(title: 'Furniture', textColor: textColor),
                  _NavButton(title: 'Shop', textColor: textColor),
                  _NavButton(title: 'About Us', textColor: textColor),
                  _NavButton(title: 'Contact', textColor: textColor),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.shopping_bag_outlined, color: textColor),
                    onPressed: () {},
                  ),
                ],
              )
            else
              IconButton(
                icon: Icon(Icons.menu, color: textColor),
                onPressed: () {
                  // TODO: Open Drawer
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final Color textColor;

  const _NavButton({required this.title, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
