import 'package:flutter/material.dart';
import 'package:testweb/theme/app_theme.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      color: AppTheme.primaryColor,
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Logo Area
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFDFDFD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'FIOT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          
          // Menu Items
          _SideBarItem(icon: Icons.grid_view_rounded, isSelected: true),
          const SizedBox(height: 20),
          _SideBarItem(icon: Icons.home_outlined),
          const SizedBox(height: 20),
          _SideBarItem(icon: Icons.check_circle_outline),
          const SizedBox(height: 20),
          _SideBarItem(icon: Icons.person_outline),
          
          const Spacer(),
           _SideBarItem(icon: Icons.settings_outlined),
           const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _SideBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const _SideBarItem({
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.grey,
        size: 24,
      ),
    );
  }
}
