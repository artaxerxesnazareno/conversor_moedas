import 'package:collection/collection.dart';
import 'package:conversor_moedas/core/domain/Entities/moeda.dart';
import 'package:conversor_moedas/core/use_case/moeda_use_case.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final aoaController = TextEditingController();
  final usdController = TextEditingController();
  final eurController = TextEditingController();
  double dolar = 0;
  double euro = 0;
  MoedaUseCase moedaUseCase = MoedaUseCase();
  void _aoaChanged(String value) {
    if (value.isEmpty) return;
    double kwanzas = double.parse(value);

    usdController.text = (kwanzas / dolar).toStringAsFixed(2);
    eurController.text = (kwanzas / euro).toStringAsFixed(2);
  }

  void _usdChanged(String value) {
    if (value.isEmpty) return;
    double dolares = double.parse(value);

    aoaController.text = (dolares * dolar).toStringAsFixed(2);
    eurController.text = (dolares * dolar / euro).toStringAsFixed(2);
  }

  void _eurChanged(String value) {
    if (value.isEmpty) return;
    double euros = double.parse(value);

    aoaController.text = (euros * euro).toStringAsFixed(2);
    usdController.text = (euros * euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const FittedBox(child: Text("\$ Conversor de Moedas \$")),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: moedaUseCase.getMoedas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                  child: Text(
                'Erro ao carregar dados',
                style: TextStyle(color: Colors.red),
              ));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              final moedas = snapshot.data as List<Moeda>;
              dolar = moedas
                      .firstWhereOrNull((moeda) => moeda.code == 'USD')
                      ?.ask ??
                  0;
              euro = moedas
                      .firstWhereOrNull((moeda) => moeda.code == 'EUR')
                      ?.ask ??
                  0;
            }
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.monetization_on,
                      size: 150, color: Colors.amber),
                  _buildTextField('Kwanzas', 'AOA', aoaController, _aoaChanged),
                  _buildTextField('Dolars', 'USD', usdController, _usdChanged),
                  _buildTextField('Euro', 'EUR', eurController, _eurChanged),
                ],
              ),
            ));
          }),
    ));
  }

  Widget _buildTextField(String label, String prefix,
      TextEditingController controller, void Function(String) onChangedCustom) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.amber),
          border: OutlineInputBorder(),
          focusColor: Colors.amber,
          prefixText: "$prefix ",
          prefixStyle: TextStyle(color: Colors.amber, fontSize: 25.0),
        ),
        style: TextStyle(color: Colors.amber, fontSize: 25.0),
        onChanged: onChangedCustom,
        controller: controller,
      ),
    );
  }
}
