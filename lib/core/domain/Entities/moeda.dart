class Moeda {
  String? _code;
  double? _ask;
  double? _bid;

  Moeda({
    String? code,
    double? bid,
    double? ask,
  }) {
    if (code != null) {
      this._code = code;
    }

    if (bid != null) {
      this._bid = bid;
    }
    if (ask != null) {
      this._ask = ask;
    }
  }

  String? get code => _code;

  set code(String? code) => _code = code;

  double? get bid => _bid;

  set bid(double? bid) => _bid = bid;

  double? get ask => _ask;

  set ask(double? ask) => _ask = ask;

  Moeda.fromJson(Map<String, dynamic> json) {
    _code = json['code'];

    _bid = double.parse(json['bid']);
    _ask = double.parse(json['ask']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = this._code;

    data['bid'] = this._bid;
    data['ask'] = this._ask;

    return data;
  }
}
