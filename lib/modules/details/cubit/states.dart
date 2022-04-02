import 'package:youngeyes/models/comments/add.dart';
import 'package:youngeyes/models/comments/getall.dart';
import 'package:youngeyes/models/details/details.dart';
import 'package:youngeyes/models/fav/favmodel.dart';

abstract class NewsDetailsStates {}

class NewsDetailsInitialState extends NewsDetailsStates {}

class NewsDetailsLoadingState extends NewsDetailsStates {}

class NewsDetailsSuccessState extends NewsDetailsStates {}

class NewsDetailsErrorState extends NewsDetailsStates {
  NewsDetailsModel newsDetailsModel;
  NewsDetailsErrorState(this.newsDetailsModel);
}

class AddCommentSuccessState extends NewsDetailsStates {}

class AddCommentErrorState extends NewsDetailsStates {
  AddCommentModel addCommentModel;
  AddCommentErrorState(this.addCommentModel);
}

class GetAllSuccessState extends NewsDetailsStates {}

class GetAllErrorState extends NewsDetailsStates {
  GetCommentsModel getCommentsModel;
  GetAllErrorState(this.getCommentsModel);
}

class CommentsLoadingState extends NewsDetailsStates {}

class AddFavSuccessState extends NewsDetailsStates {}

class AddFavErrorState extends NewsDetailsStates {
  FavouriteModel favouriteModel;
  AddFavErrorState(this.favouriteModel);
}

class ChangeBorderFavSuccessState extends NewsDetailsStates {}
