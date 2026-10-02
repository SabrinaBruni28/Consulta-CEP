import 'package:flutter/material.dart';
import 'package:flutter_cep/ui/widgets/address_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
        leading: Icon(Icons.location_city),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            // Item Do topo
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withValues(alpha: 0.1),
                    theme.colorScheme.secondary.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                spacing: 4,
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                  Text(
                    "Busque por qualquer CEP",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  Text(
                    "Digite o CEP e descubra o endereço completo",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Input de CEP
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 9,

              decoration: InputDecoration(
                labelText: "CEP",
                hintText: "Digite o CEP (ex: 01310-100)",
                prefixIcon: Icon(Icons.location_on_rounded),
                counterText: "",
              ),
            ),

            // Botão de Ação
            AnimatedSwitcher(
              duration: Duration.zero,
              child: ElevatedButton.icon(
                label: Text("Buscar CEP"),
                icon: const Icon(Icons.search_rounded),

                onPressed: () {},
              ),
            ),

            // Lista de resultado
            AddressWidget(),
          ],
        ),
      ),
    );
  }
}
