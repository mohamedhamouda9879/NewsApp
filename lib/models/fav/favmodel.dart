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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['is_in_favorite'] = this.isInFavorite;
    data['post_id'] = this.postId;
    data['favorite_id'] = this.favoriteId;
    return data;
  }
}
