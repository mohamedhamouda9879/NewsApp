class GetCommentsModel {
  List<ResultUser>? resultUser;

  GetCommentsModel({this.resultUser});

  GetCommentsModel.fromJson(Map<String, dynamic> json) {
    if (json['Comments'] != null) {
      resultUser = <ResultUser>[];
      json['Comments'].forEach((v) {
        resultUser!.add(new ResultUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resultUser != null) {
      data['Comments'] = this.resultUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultUser {
  int? id;
  String? content;
  String? postId;
  String? userId;
  Null? rememberToken;
  String? createdAt;
  String? updatedAt;
  User? user;

  ResultUser(
      {this.id,
      this.content,
      this.postId,
      this.userId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.user});

  ResultUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    postId = json['post_id'];
    userId = json['user_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  Null? emailVerifiedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password_confirmation'] = this.passwordConfirmation;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
