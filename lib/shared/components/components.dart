import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youngeyes/models/allfav/all.dart';
import 'package:youngeyes/models/news/newsmodel.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: background),
    );

Widget CommentItem(String comment, BuildContext context) => Card(
      elevation: 3.0,
      shadowColor: Colors.blueGrey,
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)),
      child: Container(
        padding: EdgeInsets.all(6.0),
        alignment: Alignment.topLeft,
        child: Text(
          comment,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.black),
        ),
      ),
    );

Widget NewsItem(
        {required AllNews allNews,
        required BuildContext context,
        required int index,
        required Function function}) =>
    GestureDetector(
      onTap: () {
        function();
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          elevation: 13.0,
          child: Container(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FadeInImage(
                    height: 200,
                    placeholder: AssetImage('assets/images/placeholder.png'),
                    image: NetworkImage(
                        'https://whitecompressor.com/storage/${allNews.post?[index].image}')),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${allNews.post?[index].title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '${allNews.post?[index].content}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '${allNews.post?[index].createdAt}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

Widget NewsItemFav(
        {required GetAllFavouriteModel getAllFavouriteModel,
        required BuildContext context,
        required int index,
        required Function function}) =>
    GestureDetector(
      onTap: () {
        function();
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          elevation: 13.0,
          child: Container(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FadeInImage(
                    height: 200,
                    placeholder: AssetImage('assets/images/placeholder.png'),
                    image: NetworkImage(
                        'https://whitecompressor.com/storage/${getAllFavouriteModel.favourites?[index].post?.image.toString()}')),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${getAllFavouriteModel.favourites?[index].post?.title.toString()}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '${getAllFavouriteModel.favourites?[index].post?.content.toString()}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '${getAllFavouriteModel.favourites?[index].post?.createdAt.toString()}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  int? lines,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      maxLines: lines,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget CategoryItem(BuildContext context, double width, double height,
        String? image, String? titleEg, String? titleAr, Function function) =>
    GestureDetector(
      onTap: () {
        function();
      },
      child: Card(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(3.0),
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                width: width,
                height: height,
                imageUrl: 'https://whitecompressor.com/storage/${image}',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              margin: EdgeInsets.all(4.0),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black54,
                          ),
                          child: Text(
                            '${titleEg}',
                            style: GoogleFonts.tajawal(
                              fontSize: 20,
                              color: Colors.white,

                              //backgroundColor: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black54,
                          ),
                          child: Text(
                            '${titleAr}',
                            style: GoogleFonts.tajawal(
                              fontSize: 20,
                              color: Colors.white,

                              //backgroundColor: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void NavigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void NavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

void showToast({required String message, required ToastStates toastStates}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(toastStates),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, EROOR, WARNING }
Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.EROOR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.blue;
      break;
  }
  return color;
}
