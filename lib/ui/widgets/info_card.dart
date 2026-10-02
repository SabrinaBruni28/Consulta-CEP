import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          width: 1,
          color: Colors.blue.withValues(alpha: 0.2),
        ),

        borderRadius: BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withValues(alpha: 0.1),
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
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),

            child: Icon(
              Icons.home,
              size: 24,
              color: Colors.red,
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
                  "CEP",
                  style:
                      Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  "0111-000",
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
    );
  }
}
