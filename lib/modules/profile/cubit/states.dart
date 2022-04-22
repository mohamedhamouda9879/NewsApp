// abstract class ProfileStates {}

// class ProfileInitialState extends ProfileStates {}

// class ProfileSuccessState extends ProfileStates {}

// class ProfileErrorState extends ProfileStates {
//   ProfileModel profileModel;
//   ProfileErrorState(this.profileModel);
// }
import 'package:youngeyes/models/topviewed/top.dart';

abstract class TopViewStates {}

class TopViewInitialState extends TopViewStates {}

class TopViewSuccessState extends TopViewStates {}

class TopViewErrorState extends TopViewStates {
  TopViewer topViewer;
  TopViewErrorState(this.topViewer);
}
