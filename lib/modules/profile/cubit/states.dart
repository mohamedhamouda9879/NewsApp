import 'package:youngeyes/models/profile/profile.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  ProfileModel profileModel;
  ProfileErrorState(this.profileModel);
}
