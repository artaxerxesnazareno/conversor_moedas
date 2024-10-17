class Moeda {
  String? _code;
  String? _codein;
  String? _name;
  String? _high;
  String? _low;
  String? _varBid;
  String? _pctChange;
  String? _bid;
  String? _ask;
  String? _timestamp;
  String? _createDate;

  Moeda(
      {String? code,
      String? codein,
      String? name,
      String? high,
      String? low,
      String? varBid,
      String? pctChange,
      String? bid,
      String? ask,
      String? timestamp,
      String? createDate}) {
    if (code != null) {
      this._code = code;
    }
    if (codein != null) {
      this._codein = codein;
    }
    if (name != null) {
      this._name = name;
    }
    if (high != null) {
      this._high = high;
    }
    if (low != null) {
      this._low = low;
    }
    if (varBid != null) {
      this._varBid = varBid;
    }
    if (pctChange != null) {
      this._pctChange = pctChange;
    }
    if (bid != null) {
      this._bid = bid;
    }
    if (ask != null) {
      this._ask = ask;
    }
    if (timestamp != null) {
      this._timestamp = timestamp;
    }
    if (createDate != null) {
      this._createDate = createDate;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  String? get codein => _codein;
  set codein(String? codein) => _codein = codein;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get high => _high;
  set high(String? high) => _high = high;
  String? get low => _low;
  set low(String? low) => _low = low;
  String? get varBid => _varBid;
  set varBid(String? varBid) => _varBid = varBid;
  String? get pctChange => _pctChange;
  set pctChange(String? pctChange) => _pctChange = pctChange;
  String? get bid => _bid;
  set bid(String? bid) => _bid = bid;
  String? get ask => _ask;
  set ask(String? ask) => _ask = ask;
  String? get timestamp => _timestamp;
  set timestamp(String? timestamp) => _timestamp = timestamp;
  String? get createDate => _createDate;
  set createDate(String? createDate) => _createDate = createDate;

  Moeda.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _codein = json['codein'];
    _name = json['name'];
    _high = json['high'];
    _low = json['low'];
    _varBid = json['varBid'];
    _pctChange = json['pctChange'];
    _bid = json['bid'];
    _ask = json['ask'];
    _timestamp = json['timestamp'];
    _createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = this._code;
    data['codein'] = this._codein;
    data['name'] = this._name;
    data['high'] = this._high;
    data['low'] = this._low;
    data['varBid'] = this._varBid;
    data['pctChange'] = this._pctChange;
    data['bid'] = this._bid;
    data['ask'] = this._ask;
    data['timestamp'] = this._timestamp;
    data['create_date'] = this._createDate;
    return data;
  }
}
