class UserInfo {
  String? firstName;
  String? lastName;
  String? email;
  bool? userConsent;
  bool? isActiveListening;

  UserInfo(
      {this.firstName,
        this.lastName,
        this.email,
        this.userConsent,
        this.isActiveListening});

  UserInfo.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    userConsent = json['user_consent'];
    isActiveListening = json['is_active_listening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['user_consent'] = userConsent;
    data['is_active_listening'] = isActiveListening;
    return data;
  }
}