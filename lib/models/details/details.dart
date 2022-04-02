class NewsDetailsModel {
  int? id;
  String? title;
  String? content;
  String? image;
  String? categoryId;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  List<Comments>? comments;
  List<Favourites>? favourites;
  Catagery? catagery;

  NewsDetailsModel(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.categoryId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.comments,
      this.favourites,
      this.catagery});

  NewsDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    categoryId = json['category_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    if (json['favourites'] != null) {
      favourites = <Favourites>[];
      json['favourites'].forEach((v) {
        favourites!.add(new Favourites.fromJson(v));
      });
    }
    catagery = json['catagery'] != null
        ? new Catagery.fromJson(json['catagery'])
        : null;
  }
}

class Comments {
  int? id;
  String? content;
  String? postId;
  String? userId;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  User? user;

  Comments(
      {this.id,
      this.content,
      this.postId,
      this.userId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    postId = json['post_id'];
    userId = json['user_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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

class Favourites {
  int? id;
  String? favourite;
  String? userId;
  String? postId;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  Favourites(
      {this.id,
      this.favourite,
      this.userId,
      this.postId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Favourites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    favourite = json['favourite'];
    userId = json['user_id'];
    postId = json['post_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Catagery {
  int? id;
  String? artitle;
  String? entitle;
  String? image;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  Catagery(
      {this.id,
      this.artitle,
      this.entitle,
      this.image,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Catagery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    artitle = json['Artitle'];
    entitle = json['Entitle'];
    image = json['image'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
