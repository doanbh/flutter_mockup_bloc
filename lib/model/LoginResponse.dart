
class LoginResponse{
  LoginResponse({
      Data? data, 
      dynamic error,}){
    _data = data;
    _error = error;
}

  LoginResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  Data? _data;
  dynamic _error;
LoginResponse copyWith({  Data? data,
  dynamic error,
}) => LoginResponse(  data: data ?? _data,
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
      String? accessToken, 
      String? refreshToken, 
      String? message,}){
    _result = result;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _message = message;
}

  Data.fromJson(dynamic json) {
    _result = json['result'];
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
    _message = json['message'];
  }
  bool? _result;
  String? _accessToken;
  String? _refreshToken;
  String? _message;
Data copyWith({  bool? result,
  String? accessToken,
  String? refreshToken,
  String? message,
}) => Data(  result: result ?? _result,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
  message: message ?? _message,
);
  bool? get result => _result;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    map['message'] = _message;
    return map;
  }

}