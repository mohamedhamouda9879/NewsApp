class AllNews {
  int? id;
  String? artitle;
  String? entitle;
  String? image;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  List<Post>? post;

  AllNews(
      {this.id,
      this.artitle,
      this.entitle,
      this.image,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.post});

  AllNews.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Artitle'] = this.artitle;
    data['Entitle'] = this.entitle;
    data['image'] = this.image;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.post != null) {
      data['post'] = this.post!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  String? content;
  String? postId;
  String? userId;
  Null? rememberToken;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
