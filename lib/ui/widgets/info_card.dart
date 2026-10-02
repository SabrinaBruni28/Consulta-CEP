import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: subtitle != "",
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),

        decoration: BoxDecoration(
          color: Colors.white,

          border: Border.all(
            width: 1,
            color: color.withValues(alpha: 0.2),
          ),

          borderRadius: BorderRadius.circular(12),

          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: color.withValues(alpha: 0.1),
              offset: Offset(0, 2),
            ),
          ],
        ),

        child: Row(
          children: [
            // Icone
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Icon(
                icon,
                size: 24,
                color: color,
              ),
            ),

            const SizedBox(
              width: 10,
            ),

            // Informação
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style:
                        Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    subtitle,
                    style:
                        Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
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
