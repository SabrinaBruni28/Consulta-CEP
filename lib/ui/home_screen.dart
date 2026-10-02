import 'package:flutter_cep/models/cep_model.dart';
import 'package:flutter_cep/repositories/cep_repository.dart';
import 'package:flutter_cep/ui/widgets/address_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = CepRepository(client: http.Client());
  final cepController = TextEditingController();
  String? errorMessage;
  CepModel? cepModel;

  Future buscarCep() async {
    setState(() {
      errorMessage = null;
      cepModel = null;
    });
    final cep = cepController.text.trim();

    if (cep.isEmpty) {
      setState(() {
        errorMessage = "Digite um CEP válido";
      });
    }

    try {
      final addresModel = await repository.consultarCep(cep);
      setState(() {
        errorMessage = null;
        cepModel = addresModel;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Erro ao busca endereço";
      });
    }
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

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
              maxLength: 8,
              keyboardType: TextInputType.number,
              controller: cepController,

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

                onPressed: buscarCep,
              ),
            ),

            // Mensagem de Erro
            Visibility(
              visible: errorMessage != null,
              child: Container(
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.error.withValues(alpha: 0.3),
                  ),
                ),

                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 24,
                      color: theme.colorScheme.error,
                    ),

                    SizedBox(
                      width: 12,
                    ),

                    Text(
                      errorMessage ?? '',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Lista de resultado
            Visibility(
              visible: cepModel != null,
              child: AddressWidget(
                cepModel: cepModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
