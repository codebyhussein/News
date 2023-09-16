import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/services/app_Function.dart';
import 'package:news/utils/constants.dart';

class NewsBuilder extends StatelessWidget {
  NewsBuilder(
      {super.key,
      required this.publishedAt,
      required this.title,
      required this.urlToImage,
      required this.url});
  String urlToImage;

  String publishedAt;
  String title;

  String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppFunction.launchInBrowser(Uri.parse(url));
      },
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: const [AppConst.defultBoxShadow],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          height: 110.h,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                        height: 110.h,
                        width: 110.w,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          urlToImage,
                        ))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      publishedAt,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
