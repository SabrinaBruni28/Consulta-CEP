import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_cep/repositories/cep_repository.dart';
import 'package:flutter_cep/ui/widgets/address_widget.dart';
import 'package:flutter_cep/models/cep_model.dart';
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
  final cepFormater = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  String? errorMessage;
  CepModel? cepModel;
  bool isLoading = false;

  Future buscarCep() async {
    // Tira o foco do input tirando o teclado
    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
      errorMessage = null;
      cepModel = null;
    });

    // Pega o conteúdo do input
    final cep = cepController.text.trim();

    // Caso seja vazio
    if (cep.isEmpty) {
      setState(() {
        errorMessage = "Digite um CEP válido";
        isLoading = false;
      });
      return;
    }

    // Busca os dados
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
    } finally {
      setState(() {
        isLoading = false;
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
              maxLength: 9,
              keyboardType: TextInputType.number,
              controller: cepController,
              inputFormatters: [cepFormater],

              decoration: InputDecoration(
                labelText: "CEP",
                hintText: "Digite o CEP (ex: 01310-100)",
                prefixIcon: Icon(Icons.location_on_rounded),
                counterText: "",
              ),
            ),

            // Botão de Ação
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: isLoading
                  // Carregando
                  ? Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Row(
                          spacing: 12,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                              ),
                            ),
                            Text(
                              "Buscando CEP...",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  // Botão
                  : ElevatedButton.icon(
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
              child: AnimatedOpacity(
                opacity: cepModel != null ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: AddressWidget(
                  cepModel: cepModel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
