import 'package:flutter_cep/ui/widgets/info_card.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.secondary,
              ],
            ),
          ),

          // Bloco do topo
          child: Column(
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: 48,
                color: Colors.white,
              ),

              const SizedBox(
                height: 8,
              ),

              Text(
                "CEP Encontrado!",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),

              Text(
                "Informações do Endereço",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        // Lista de informações
        InfoCard(),
      ],
    );
  }
}
