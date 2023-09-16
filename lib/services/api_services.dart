import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news_model/news_model.dart';

class ApiServices {
  // getdata business
  static Future getBusiness() async {
    var url = Uri.https('newsapi.org', 'v2/top-headlines', {
      "country": "us",
      "category": "business",
      "apiKey": "30832e797c864d8c994fb761b55bebff"
    });
    var response = await http.get(url);

    List getAllNews = [];

    Map data = jsonDecode(response.body);
    for (var item in data['articles']) {
      getAllNews.add(item);
    }
    return NewsModel.NewsFromSnapshot(getAllNews);
  }

  // getdata Sports

  static Future getSports() async {
    var url = Uri.https('newsapi.org', 'v2/top-headlines', {
      "country": "us",
      "category": "sports",
      "apiKey": "30832e797c864d8c994fb761b55bebff"
    });
    var response = await http.get(url);

    List getAllNews = [];

    Map data = jsonDecode(response.body);
    for (var item in data['articles']) {
      getAllNews.add(item);
    }
    return NewsModel.NewsFromSnapshot(getAllNews);
  }

  // getdata science
  static Future getScience() async {
    var url = Uri.https('newsapi.org', 'v2/top-headlines', {
      "country": "us",
      "category": "science",
      "apiKey": "30832e797c864d8c994fb761b55bebff"
    });
    var response = await http.get(url);

    List getAllNews = [];

    Map data = jsonDecode(response.body);
    for (var item in data['articles']) {
      getAllNews.add(item);
    }
    return NewsModel.NewsFromSnapshot(getAllNews);
  }

  static Future<List<NewsModel>> getSearch(String? value) async {
    var url = Uri.https('newsapi.org', 'v2/top-headlines',
        {"q": "$value", "apiKey": "30832e797c864d8c994fb761b55bebff"});

    var response = await http.get(url);

    List searchResult = [];

    Map data = jsonDecode(response.body);
    for (var item in data['articles']) {
      searchResult.add(item);
    }
    return NewsModel.NewsFromSnapshot(searchResult);
  }
}
