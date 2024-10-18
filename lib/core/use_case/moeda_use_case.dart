import 'package:conversor_moedas/core/domain/Entities/moeda.dart';
import 'package:conversor_moedas/infrastructure/adapters/http_adapter/http_adapter.dart';

class MoedaUseCase {
  static final httpAdapter = HttpAdapter();
  final moedas = ['last/USD-AOA', 'last/EUR-AOA'];
  Future<List<Moeda>> getMoedas() async {
    List<Moeda> moedas = [];
    for (var moeda in this.moedas) {
      final response = await httpAdapter.get(moeda as String);
      if (response.sucess) {
        moedas.add(Moeda.fromJson(
            response.object['USDAOA'] ?? response.object['EURAOA']));
      } else {
        response.handleHttpResponse();
      }
    }
    return moedas;
  }
}
