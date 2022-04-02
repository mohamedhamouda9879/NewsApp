class AddCommentModel {
  String? content;
  String? userId;
  String? postId;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddCommentModel(
      {this.content,
      this.userId,
      this.postId,
      this.updatedAt,
      this.createdAt,
      this.id});

  AddCommentModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    userId = json['user_id'];
    postId = json['post_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
