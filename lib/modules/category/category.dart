import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youngeyes/modules/category/cubit/cubit.dart';
import 'package:youngeyes/modules/category/cubit/states.dart';
import 'package:youngeyes/modules/news/news.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/styles/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider(
      create: ((context) => CategoryCubit()..getCategory(context)),
      child: BlocConsumer<CategoryCubit, CategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CategorySuccessState) {
            return Scaffold(
              body: ConditionalBuilderRec(
                condition: CategoryCubit.get(context).categoryModel.isNotEmpty,
                builder: (context) => AnimationLimiter(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: CategoryCubit.get(context).categoryModel.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                          context,
                          mq.width * 0.80,
                          mq.height * 0.30,
                          CategoryCubit.get(context).categoryModel[index].image,
                          CategoryCubit.get(context)
                              .categoryModel[index]
                              .entitle,
                          CategoryCubit.get(context)
                              .categoryModel[index]
                              .artitle, () {
                        NavigateTo(
                            context,
                            NewsScreen(CategoryCubit.get(context)
                                .categoryModel[index]
                                .id
                                .toString()));
                      });
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                  ),
                ),
                fallback: (context) => Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: defaultColor,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: defaultColor,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: defaultColor,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: defaultColor,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
