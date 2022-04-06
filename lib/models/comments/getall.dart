class GetCommentsModel {
  List<ResultUser>? resultUser;

  GetCommentsModel({this.resultUser});

  GetCommentsModel.fromJson(Map<String, dynamic> json) {
    if (json['Comments'] != null) {
      resultUser = <ResultUser>[];
      json['Comments'].forEach((v) {
        resultUser!.add(ResultUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resultUser != null) {
      data['Comments'] = resultUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultUser {
  int? id;
  String? content;
  String? postId;
  String? userId;
  String? rememberToken;
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['post_id'] = postId;
    data['user_id'] = userId;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
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
