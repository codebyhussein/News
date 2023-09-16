// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/news_model/news_model.dart';
import 'package:news/services/api_services.dart';
import 'package:news/utils/constants.dart';
import 'package:news/view/widgets/NewsBuilder.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.backGroud,
        body: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 45.h,
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    label: const Text(
                      'Search',
                    ),
                    hintText: 'Tap To Search',
                  ),
                  onChanged: ((value) {
                    setState(() {
                      ApiServices.getSearch(value);
                    });
                    searchController.text = value;
                  }),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search Must Be not Empty';
                    }
                    return null;
                  },
                ),
              ),
            ),
            FutureBuilder(
              future: ApiServices.getSearch(searchController.text),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'search now',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ));
                } else if (snapshot.hasData) {
                  List<NewsModel> getSearch = snapshot.data!;
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return NewsBuilder(
                              publishedAt: getSearch[index].publishedAt!,
                              title: getSearch[index].title!,
                              urlToImage: getSearch[index].urlToImage!,
                              url: getSearch[index].url!);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemCount: getSearch.length),
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppConst.kMainColor,
                  ));
                }
              },
            )
          ],
        ));
  }
}



/*
Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      label: Text(
                        'Search',
                      ),
                      hintText: 'Tap To Search',
                    ),
                    onChanged: ((value) {
                      newsCubits.get(context).getSearch(value);
                    }),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Search Must Be not Empty';
                      }
                      return null;
                    },
                  ),
                ),
                //  articleBuilder(list, context),
                Expanded(child: articleBuilder(list, context, isSearch: true)),
              ],
            ),
*/