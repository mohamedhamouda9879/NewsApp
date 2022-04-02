import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/models/allfav/all.dart';
import 'package:youngeyes/modules/favourites/cubit/states.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

class GetAllFavCubit extends Cubit<GetAllFavStates> {
  GetAllFavCubit() : super(GetAllFavInitialState());

  static GetAllFavCubit get(context) => BlocProvider.of(context);

  GetAllFavouriteModel? getAllFavouriteModel;

  void getAllFav(String id) async {
    emit(GetAllFavLoadingState());

    await DioHelper.getData(Url: 'fav/${id}').then((value) {
      getAllFavouriteModel = GetAllFavouriteModel.fromJson(value.data);
      emit(GetAllFavSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetAllFavErrorState(error));
    });
  }
}
