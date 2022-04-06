// ignore_for_file: prefer_collection_literals

class CheckFavModel {
  String? message;
  bool? isInFavorite;
  int? postId;
  int? favoriteId;

  CheckFavModel(
      {this.message, this.isInFavorite, this.postId, this.favoriteId});

  CheckFavModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isInFavorite = json['is_in_favorite'];
    postId = json['post_id'];
    favoriteId = json['favorite_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['is_in_favorite'] = isInFavorite;
    data['post_id'] = postId;
    data['favorite_id'] = favoriteId;
    return data;
  }
}
