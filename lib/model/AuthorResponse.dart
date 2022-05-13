class AuthorResponse {
  AuthorResponse({
      DataAuthorResponse? data,
      dynamic error,}){
    _data = data;
    _error = error;
}

  AuthorResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? DataAuthorResponse.fromJson(json['data']) : null;
    _error = json['error'];
  }
  DataAuthorResponse? _data;
  dynamic _error;
AuthorResponse copyWith({  DataAuthorResponse? data,
  dynamic error,
}) => AuthorResponse(  data: data ?? _data,
  error: error ?? _error,
);
  DataAuthorResponse? get data => _data;
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

class DataAuthorResponse {
  DataAuthorResponse({
      bool? result, 
      String? message, 
      List<ItemsAuthorResponse>? items,}){
    _result = result;
    _message = message;
    _items = items;
}

  DataAuthorResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(ItemsAuthorResponse.fromJson(v));
      });
    }
  }
  bool? _result;
  String? _message;
  List<ItemsAuthorResponse>? _items;
DataAuthorResponse copyWith({  bool? result,
  String? message,
  List<ItemsAuthorResponse>? items,
}) => DataAuthorResponse(  result: result ?? _result,
  message: message ?? _message,
  items: items ?? _items,
);
  bool? get result => _result;
  String? get message => _message;
  List<ItemsAuthorResponse>? get items => _items;

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

class ItemsAuthorResponse {
  ItemsAuthorResponse({
      String? createdAt, 
      String? name, 
      String? avatar, 
      String? id,}){
    _createdAt = createdAt;
    _name = name;
    _avatar = avatar;
    _id = id;
}

  ItemsAuthorResponse.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _name = json['name'];
    _avatar = json['avatar'];
    _id = json['id'];
  }
  String? _createdAt;
  String? _name;
  String? _avatar;
  String? _id;
ItemsAuthorResponse copyWith({  String? createdAt,
  String? name,
  String? avatar,
  String? id,
}) => ItemsAuthorResponse(  createdAt: createdAt ?? _createdAt,
  name: name ?? _name,
  avatar: avatar ?? _avatar,
  id: id ?? _id,
);
  String? get createdAt => _createdAt;
  String? get name => _name;
  String? get avatar => _avatar;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['id'] = _id;
    return map;
  }

}