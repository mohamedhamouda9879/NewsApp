class RegisterModel {
  User? user;
  String? token;

  RegisterModel({this.user, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
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
}
