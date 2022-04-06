class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? emailVerifiedAt;
  String? passwordConfirmation;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.passwordConfirmation,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    passwordConfirmation = json['password_confirmation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['password_confirmation'] = passwordConfirmation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
