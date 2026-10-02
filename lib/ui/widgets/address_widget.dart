import 'package:flutter_cep/ui/widgets/info_card.dart';
import 'package:flutter_cep/models/cep_model.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final CepModel? cepModel;

  const AddressWidget({super.key, this.cepModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (cepModel == null) {
      return SizedBox.shrink();
    }

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
        InfoCard(
          icon: Icons.location_on_rounded,
          title: "CEP",
          subtitle: cepModel!.cep,
          color: Colors.purple,
        ),

        InfoCard(
          icon: Icons.streetview_rounded,
          title: "Logradouro",
          subtitle: cepModel!.logradouro,
          color: Colors.pink,
        ),

        InfoCard(
          icon: Icons.home_rounded,
          title: "Bairro",
          subtitle: cepModel!.bairro,
          color: Colors.cyan,
        ),

        InfoCard(
          icon: Icons.location_city_rounded,
          title: "Cidade",
          subtitle: cepModel!.localidade,
          color: Colors.green,
        ),

         InfoCard(
          icon: Icons.map_rounded,
          title: "Estado",
          subtitle: cepModel!.estado,
          color: Colors.orange,
        ),

        InfoCard(
          icon: Icons.info_rounded,
          title: "Complemento",
          subtitle: cepModel!.complemento,
          color: Colors.brown,
        ),
      ],
    );
  }
}
