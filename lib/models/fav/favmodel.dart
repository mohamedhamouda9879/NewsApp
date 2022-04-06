class FavouriteModel {
  String? message;
  bool? isInFavorite;
  int? postId;
  int? favoriteId;

  FavouriteModel(
      {this.message, this.isInFavorite, this.postId, this.favoriteId});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isInFavorite = json['is_in_favorite'];
    postId = json['post_id'];
    favoriteId = json['favorite_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['is_in_favorite'] = isInFavorite;
    data['post_id'] = postId;
    data['favorite_id'] = favoriteId;
    return data;
  }
}
