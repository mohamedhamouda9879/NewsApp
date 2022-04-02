import 'package:youngeyes/models/allfav/all.dart';

abstract class GetAllFavStates {}

class GetAllFavInitialState extends GetAllFavStates {}

class GetAllFavLoadingState extends GetAllFavStates {}

class GetAllFavSuccessState extends GetAllFavStates {}

class GetAllFavErrorState extends GetAllFavStates {
  GetAllFavouriteModel getAllFavouriteModel;
  GetAllFavErrorState(this.getAllFavouriteModel);
}
