class TopViewer {
  TopViewer({
    this.id,
    this.title,
    this.content,
    this.image,
    this.categoryId,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.reads,
    this.comments,
    this.favourites,
    this.catagery,
  });

  int? id;
  String? title;
  String? content;
  String? image;
  String? categoryId;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? reads;
  List<Comment>? comments;
  List<Comment>? favourites;
  Catagery? catagery;

  factory TopViewer.fromJson(Map<String, dynamic> json) => TopViewer(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        categoryId: json["category_id"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        reads: json["reads"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        favourites: List<Comment>.from(
            json["favourites"].map((x) => Comment.fromJson(x))),
        catagery: Catagery.fromJson(json["catagery"]),
      );
}

class Catagery {
  Catagery({
    this.id,
    this.artitle,
    this.entitle,
    this.image,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? artitle;
  String? entitle;
  String? image;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Catagery.fromJson(Map<String, dynamic> json) => Catagery(
        id: json["id"],
        artitle: json["Artitle"],
        entitle: json["Entitle"],
        image: json["image"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Comment {
  Comment({
    this.id,
    this.content,
    this.postId,
    this.userId,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.favourite,
  });

  int? id;
  String? content;
  String? postId;
  String? userId;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  String? favourite;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        content: json["content"],
        postId: json["post_id"],
        userId: json["user_id"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        favourite: json["favourite"],
      );
}

class User {
  User({
    this.id,
    this.email,
    this.emailVerifiedAt,
    this.passwordConfirmation,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? passwordConfirmation;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        passwordConfirmation: json["password_confirmation"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
