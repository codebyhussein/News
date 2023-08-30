import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news/models/news_model/news_model.dart';
import 'package:news/services/api_services.dart';
import 'package:news/widgets/NewsBuilder.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getBusiness(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('error hapend'));
        } else if (snapshot.hasData) {
          List<NewsModel> getBusiness = snapshot.data;
          return ListView.separated(
              itemBuilder: (context, index) {
                return NewsBuilder(
                    publishedAt: getBusiness[index].publishedAt!,
                    title: getBusiness[index].title!,
                    urlToImage: getBusiness[index].urlToImage!,
                    url: getBusiness[index].url!);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: getBusiness.length);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
