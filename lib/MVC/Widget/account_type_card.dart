import 'package:flutter/material.dart';
import 'package:huanmaiw/Core/Space/insets.dart';

class AccountTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color cardColor;

  const AccountTypeCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    required this.cardColor, // Màu của từng thẻ
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250,
        width: 400,
        decoration: BoxDecoration(
          color: cardColor, // Áp dụng màu sắc của từng mục
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 40),
                  ResInset.g16,
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
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
