class CategoryModel {
  int? id;
  String? artitle;
  String? entitle;
  String? image;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  List<Post>? post;

  CategoryModel(
      {this.id,
      this.artitle,
      this.entitle,
      this.image,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.post});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    artitle = json['Artitle'];
    entitle = json['Entitle'];
    image = json['image'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['post'] != null) {
      post = <Post>[];
      json['post'].forEach((v) {
        post!.add(new Post.fromJson(v));
      });
    }
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
  List<Comments>? comments;

  Post(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.categoryId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.comments});

  Post.fromJson(Map<String, dynamic> json) {
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

  Comments(
      {this.id,
      this.content,
      this.postId,
      this.userId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    postId = json['post_id'];
    userId = json['user_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
