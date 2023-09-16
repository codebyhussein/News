import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news/models/news_model/news_model.dart';
import 'package:news/services/api_services.dart';
import 'package:news/view/widgets/NewsBuilder.dart';

class ScienceScreen extends StatelessWidget {
  ScienceScreen({super.key});

  List<NewsModel> getAllNews = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getScience(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            'watting',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
          ));
        } else if (snapshot.hasData) {
          List<NewsModel> getScience = snapshot.data;
          return ListView.separated(
              itemBuilder: (context, index) {
                return NewsBuilder(
                    publishedAt: getScience[index].publishedAt!,
                    title: getScience[index].title!,
                    urlToImage: getScience[index].urlToImage!,
                    url: getScience[index].url!);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: getScience.length);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
