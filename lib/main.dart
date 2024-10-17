import 'package:conversor_moedas/presentation/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:conversor_moedas/infrastructure/adapters/http_adapter/http_adapter.dart';
import 'package:conversor_moedas/core/domain/Entities/moeda.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MaterialApp(
    home: ScreenHome(),
  ));

  testApiRequest();
}

Future<void> testApiRequest() async {
  final httpAdapter = HttpAdapter();
  try {
    final response = await httpAdapter.get('last/USD-AOA');
    if (response.sucess) {
      final moedaData = response.object['USDAOA'];
      final moeda = Moeda.fromJson(moedaData);
      developer.log('Moeda: ${moeda.toJson()}', name: 'API_TEST');
    } else {
      developer.log('Erro na requisição: ${response.statusCode}', name: 'API_TEST');
    }
  } catch (e) {
    developer.log('Exceção: $e', name: 'API_TEST');
  }
}
