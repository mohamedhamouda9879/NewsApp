import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youngeyes/modules/details/details.dart';
import 'package:youngeyes/modules/news/cubit/cubit.dart';
import 'package:youngeyes/modules/topviewed/cubit/cubit.dart';
import 'package:youngeyes/modules/topviewed/cubit/states.dart';
import 'package:youngeyes/shared/components/components.dart';
import 'package:youngeyes/shared/components/constants.dart';
import 'package:youngeyes/shared/styles/colors.dart';

class TopViewd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopCubit()..getTopViewd(),
      child: BlocConsumer<TopCubit, TopViewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(title: Text('Top Viewer')),
            body: ConditionalBuilderRec(
              condition: TopCubit.get(context).topViewerDataModel != null,
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) {
                    return TopViewItem(
                        topViewer:
                            TopCubit.get(context).topViewerDataModel[index],
                        context: context,
                        index: index,
                        function: () async {
                          NEWSID =
                              TopCubit.get(context).topViewer!.id.toString();
                          NavigateTo(
                              context,
                              NewsDetailsScreen(TopCubit.get(context)
                                  .topViewer!
                                  .id
                                  .toString()));
                        });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: TopCubit.get(context).topViewerDataModel.length),
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
          ));
        },
      ),
    );
  }
}
