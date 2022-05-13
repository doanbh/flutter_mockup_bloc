class City {
  City({
      Data? data, 
      dynamic error,}){
    _data = data;
    _error = error;
}

  City.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  Data? _data;
  dynamic _error;
City copyWith({  Data? data,
  dynamic error,
}) => City(  data: data ?? _data,
  error: error ?? _error,
);
  Data? get data => _data;
  dynamic get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['error'] = _error;
    return map;
  }

}

class Data {
  Data({
      bool? result, 
      String? message, 
      List<Items>? items,}){
    _result = result;
    _message = message;
    _items = items;
}

  Data.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }
  bool? _result;
  String? _message;
  List<Items>? _items;
Data copyWith({  bool? result,
  String? message,
  List<Items>? items,
}) => Data(  result: result ?? _result,
  message: message ?? _message,
  items: items ?? _items,
);
  bool? get result => _result;
  String? get message => _message;
  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Items({
      String? name, 
      int? code, 
      String? divisionType, 
      String? codename, 
      int? phoneCode, 
      List<dynamic>? districts,}){
    _name = name;
    _code = code;
    _divisionType = divisionType;
    _codename = codename;
    _phoneCode = phoneCode;
    _districts = districts;
}

  Items.fromJson(dynamic json) {
    _name = json['name'];
    _code = json['code'];
    _divisionType = json['division_type'];
    _codename = json['codename'];
    _phoneCode = json['phone_code'];
    if (json['districts'] != null) {
      _districts = [];
    }
  }
  String? _name;
  int? _code;
  String? _divisionType;
  String? _codename;
  int? _phoneCode;
  List<dynamic>? _districts;
Items copyWith({  String? name,
  int? code,
  String? divisionType,
  String? codename,
  int? phoneCode,
  List<dynamic>? districts,
}) => Items(  name: name ?? _name,
  code: code ?? _code,
  divisionType: divisionType ?? _divisionType,
  codename: codename ?? _codename,
  phoneCode: phoneCode ?? _phoneCode,
  districts: districts ?? _districts,
);
  String? get name => _name;
  int? get code => _code;
  String? get divisionType => _divisionType;
  String? get codename => _codename;
  int? get phoneCode => _phoneCode;
  List<dynamic>? get districts => _districts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['code'] = _code;
    map['division_type'] = _divisionType;
    map['codename'] = _codename;
    map['phone_code'] = _phoneCode;
    if (_districts != null) {
      map['districts'] = _districts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}