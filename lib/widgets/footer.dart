import 'package:flutter/material.dart';
import 'package:testweb/theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6), // Light blue-grey background
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                   const Icon(Icons.chevron_right, size: 16, color: Colors.black54),
                   const SizedBox(width: 8),
                   const Text(
                     'FIOT DATA MASTER',
                     style: TextStyle(color: Color(0xFF1A237E), fontWeight: FontWeight.bold, fontSize: 12),
                   ),
                   const Spacer(),
                   const Text(
                     '© 2025 Rax Tech International',
                     style: TextStyle(color: Color(0xFF1A237E), fontSize: 12),
                   ),
                   const Spacer(),
                   TextButton(
                     onPressed: (){},
                     child: const Text('Privacy', style: TextStyle(color: Color(0xFF1A237E), fontSize: 12)),
                   ),
                   const Text('•', style: TextStyle(color: Colors.black54)),
                   TextButton(
                     onPressed: (){},
                     child: const Text('Terms', style: TextStyle(color: Color(0xFF1A237E), fontSize: 12)),
                   ),
                    const Text('•', style: TextStyle(color: Colors.black54)),
                    // Help with chevron up
                    InkWell(
                      onTap: (){},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Row(
                          children: [
                            Text('Help', style: TextStyle(color: Color(0xFF1A237E), fontSize: 12)),
                            SizedBox(width: 4),
                            Icon(Icons.keyboard_arrow_up, size: 16, color: Color(0xFF1A237E))
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
