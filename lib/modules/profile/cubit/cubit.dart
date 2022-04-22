import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/models/topviewed/top.dart';
import 'package:youngeyes/modules/profile/cubit/states.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

class TopCubit extends Cubit<TopViewStates> {
  TopCubit() : super(TopViewInitialState());

  static TopCubit get(context) => BlocProvider.of(context);

  TopViewer? topViewer;
  List<TopViewer> topViewerDataModel = [];

  void getTopViewd() {
    DioHelper.getData(Url: 'topviewer').then((value) {
      (value.data).forEach(
        (element) {
          var top = TopViewer.fromJson(element);
          topViewerDataModel.add(top);
          // print(element);
        },
      );
      // topViewer = TopViewer.fromJson(value.data);
      emit(TopViewSuccessState());
    }).catchError((error) {
      emit(TopViewErrorState(error));
    });
  }
}
// class ProfileCubit extends Cubit<ProfileStates> {
//   ProfileCubit() : super(ProfileInitialState());

//   static ProfileCubit get(context) => BlocProvider.of(context);

//   ProfileModel? profileModel;
//   void getProfile(String id) {
//     DioHelper.getData(Url: 'users/$id').then((value) {
//       profileModel = ProfileModel.fromJson(value.data);
//       emit(ProfileSuccessState());
//     }).catchError((error) {
//       emit(ProfileErrorState(error));
//     });
//   }
// }
