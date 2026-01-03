import 'package:flutter/material.dart';
import 'package:testweb/theme/app_theme.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color backgroundColor;
  final Color? iconColor; 
  final IconData? backgroundIcon;
  final List<Widget> stats;
  final Widget? trailing;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.backgroundColor,
    this.iconColor,
    this.backgroundIcon,
    this.stats = const [],
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Background Shape (Simplified for now)
          Positioned(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                 color: Colors.white.withOpacity(0.2),
                 shape: BoxShape.circle,
              ),
              child: iconColor != null && backgroundIcon != null 
                  ? Icon(backgroundIcon, color: (iconColor ?? Colors.white).withOpacity(0.3), size: 40)
                  : null,
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.primaryText.withOpacity(0.7),
                    ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryText,
                          height: 1.0, 
                        ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.secondaryText,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...stats,
              if (trailing != null) ...[
                const Spacer(),
                trailing!,
              ],
            ],
          ),
        ],
      ),
    );
  }
}
