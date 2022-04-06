import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youngeyes/models/news/newsmodel.dart';
import 'package:youngeyes/modules/news/cubit/states.dart';
import 'package:youngeyes/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  AllNews? allNews;

  void getNewsForCategory(String id) {
    DioHelper.getData(Url: 'categories/$id').then((value) {
      allNews = AllNews.fromJson(value.data);
      emit(NewsSuccessState());
    }).catchError((error) {
      emit(NewsErrorState(error));
    });
  }
}
