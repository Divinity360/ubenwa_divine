import 'package:ubenwa/models/user_info.dart';

class SignUpResponse {
  String? token;
  int? userId;
  UserInfo? userInfo;

  SignUpResponse({this.token, this.userId, this.userInfo});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_id'] = userId;
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    return data;
  }
}
