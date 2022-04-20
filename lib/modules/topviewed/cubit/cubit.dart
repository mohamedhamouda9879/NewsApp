import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/models/topview/top.dart';
import 'package:youngeyes/modules/topviewed/cubit/states.dart';
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
