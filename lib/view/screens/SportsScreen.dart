import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/news_model/news_model.dart';
import 'package:news/services/api_services.dart';
import 'package:news/view/widgets/NewsBuilder.dart';

class SportsScreen extends StatelessWidget {
  SportsScreen({super.key});

  List<NewsModel> getAllNews = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getSports(),
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
          List<NewsModel> getSports = snapshot.data;
          return ListView.separated(
              itemBuilder: (context, index) {
                return NewsBuilder(
                    publishedAt: getSports[index].publishedAt!,
                    title: getSports[index].title!,
                    urlToImage: getSports[index].urlToImage!,
                    url: getSports[index].url!);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: getSports.length);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
