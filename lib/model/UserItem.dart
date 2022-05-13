class UserItem {
  UserItem({
      Data? data, 
      dynamic error,}){
    _data = data;
    _error = error;
}

  UserItem.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  Data? _data;
  dynamic _error;
UserItem copyWith({  Data? data,
  dynamic error,
}) => UserItem(  data: data ?? _data,
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
      UserInfo? userInfo,}){
    _result = result;
    _message = message;
    _userInfo = userInfo;
}

  Data.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _userInfo = json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }
  bool? _result;
  String? _message;
  UserInfo? _userInfo;
Data copyWith({  bool? result,
  String? message,
  UserInfo? userInfo,
}) => Data(  result: result ?? _result,
  message: message ?? _message,
  userInfo: userInfo ?? _userInfo,
);
  bool? get result => _result;
  String? get message => _message;
  UserInfo? get userInfo => _userInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_userInfo != null) {
      map['user_info'] = _userInfo?.toJson();
    }
    return map;
  }

}

class UserInfo {
  UserInfo({
      String? userId, 
      String? userEmail, 
      String? userName, 
      String? userImage,}){
    _userId = userId;
    _userEmail = userEmail;
    _userName = userName;
    _userImage = userImage;
}

  UserInfo.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _userName = json['user_name'];
    _userImage = json['user_image'];
  }
  String? _userId;
  String? _userEmail;
  String? _userName;
  String? _userImage;
UserInfo copyWith({  String? userId,
  String? userEmail,
  String? userName,
  String? userImage,
}) => UserInfo(  userId: userId ?? _userId,
  userEmail: userEmail ?? _userEmail,
  userName: userName ?? _userName,
  userImage: userImage ?? _userImage,
);
  String? get userId => _userId;
  String? get userEmail => _userEmail;
  String? get userName => _userName;
  String? get userImage => _userImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['user_name'] = _userName;
    map['user_image'] = _userImage;
    return map;
  }

}