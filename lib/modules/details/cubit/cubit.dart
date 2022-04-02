import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/models/check/check.dart';
import 'package:youngeyes/models/comments/add.dart';
import 'package:youngeyes/models/comments/getall.dart';
import 'package:youngeyes/models/details/details.dart';
import 'package:youngeyes/models/fav/favmodel.dart';
import 'package:youngeyes/modules/details/cubit/states.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

class NewsDetailsCubit extends Cubit<NewsDetailsStates> {
  NewsDetailsCubit() : super(NewsDetailsInitialState());

  static NewsDetailsCubit get(context) => BlocProvider.of(context);

  NewsDetailsModel? newsDetailsModel;
  AddCommentModel? addCommentModel;
  GetCommentsModel? getCommentsModel;
  FavouriteModel? favouriteModel;
  CheckFavModel? checkFavModel;

  void getNewsDetails(String id) async {
    emit(NewsDetailsLoadingState());
    await DioHelper.getData(Url: 'posts/${id}').then((value) {
      newsDetailsModel = NewsDetailsModel.fromJson(value.data);
      print('hamouda${newsDetailsModel!.image.toString()}');
      emit(NewsDetailsSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsDetailsErrorState(error));
    });
  }

  Future getComments(String id) async {
    emit(CommentsLoadingState());
    await DioHelper.getData(Url: 'search/${id}').then((value) {
      getCommentsModel = GetCommentsModel.fromJson(value.data);
      // print('hamouda${getCommentsModel!.resultUser![22].content}');

      print(getCommentsModel!.resultUser.toString());
      emit(GetAllSuccessState());
      print('hamouda xyz ');
    }).catchError((error) {
      print(error);
      emit(GetAllErrorState(error));
    });
  }

  Future addComment(String postId, String userID, String content) async {
    await DioHelper.postData(
            Url: 'comments',
            data: {'post_id': postId, 'user_id': userID, 'content': content})
        .then((value) {
      addCommentModel = AddCommentModel.fromJson(value.data);

      emit(AddCommentSuccessState());
    }).catchError((error) {
      print(error);
      emit(AddCommentErrorState(error));
    });
  }

  Future addFav(String postId, String userID) async {
    // emit(NewsDetailsSuccessState());
    await DioHelper.postData(Url: 'favourites', data: {
      'user_id': userID,
      'post_id': postId,
    }).then((value) {
      print('emit then');
      favouriteModel = FavouriteModel.fromJson(value.data);
      emit(AddFavSuccessState());
    }).catchError((error) {
      print(error);
      print('error f l catch');
      emit(AddFavErrorState(error));
    });
  }

  Future Check(String postId, String userID) async {
    await DioHelper.postData(Url: 'fav', data: {
      'post_id': postId,
      'user_id': userID,
    }).then((value) {
      checkFavModel = CheckFavModel.fromJson(value.data);

      // emit(AddCommentSuccessState());
    }).catchError((error) {
      print(error);
      // emit(AddCommentErrorState(error));
    });
  }

  IconData sufix = Icons.favorite_border;
  bool isFav = true;

  void changeFavVisibility() {
    print("isPasswordShowen : $isFav");
    isFav = !isFav;
    sufix = isFav ? Icons.favorite : Icons.favorite_border;
    emit(ChangeBorderFavSuccessState());
  }
}
