class GetAllFavouriteModel {
  List<Favourites>? favourites;

  GetAllFavouriteModel({this.favourites});

  GetAllFavouriteModel.fromJson(Map<String, dynamic> json) {
    if (json['Favourites'] != null) {
      favourites = <Favourites>[];
      json['Favourites'].forEach((v) {
        favourites!.add(Favourites.fromJson(v));
      });
    }
  }
}

class Favourites {
  int? id;
  String? favourite;
  String? userId;
  String? postId;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  Post? post;
  User? user;

  Favourites(
      {this.id,
      this.favourite,
      this.userId,
      this.postId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.post,
      this.user});

  Favourites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    favourite = json['favourite'];
    userId = json['user_id'];
    postId = json['post_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class Post {
  int? id;
  String? title;
  String? content;
  String? image;
  String? categoryId;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  Post(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.categoryId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    categoryId = json['category_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
}
