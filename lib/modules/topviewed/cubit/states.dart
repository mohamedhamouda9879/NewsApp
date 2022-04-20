import 'package:youngeyes/models/topview/top.dart';

abstract class TopViewStates {}

class TopViewInitialState extends TopViewStates {}

class TopViewSuccessState extends TopViewStates {}

class TopViewErrorState extends TopViewStates {
  TopViewer topViewer;
  TopViewErrorState(this.topViewer);
}
