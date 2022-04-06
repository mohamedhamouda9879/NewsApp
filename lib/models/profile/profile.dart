class ProfileModel {
  int? id;
  String? email;
  String? emailVerifiedAt;
  String? passwordConfirmation;
  String? createdAt;
  String? updatedAt;

  ProfileModel(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.passwordConfirmation,
      this.createdAt,
      this.updatedAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    passwordConfirmation = json['password_confirmation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
