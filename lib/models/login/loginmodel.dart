class LoginModel {
  bool? status;
  User? user;
  String? message;
  String? token;

  LoginModel({this.status, this.user, this.message, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? email;
  String? passwordConfirmation;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.email,
      this.passwordConfirmation,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    passwordConfirmation = json['password_confirmation'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password_confirmation'] = this.passwordConfirmation;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
