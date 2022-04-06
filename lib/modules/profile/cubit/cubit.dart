import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/models/profile/profile.dart';
import 'package:youngeyes/modules/profile/cubit/states.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;
  void getProfile(String id) {
    DioHelper.getData(Url: 'users/$id').then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(ProfileSuccessState());
    }).catchError((error) {
      emit(ProfileErrorState(error));
    });
  }
}
