import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news_model/news_model.dart';

class ApiServices {
  // getdata business
  static Future getBusiness() async {
    var url = Uri.https('newsapi.org', 'v2/top-headlines', {
      "country": "eg",
      "category": "business",
      "apiKey": "1892de611537491eae15e337592e5723"
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
      "country": "eg",
      "category": "sports",
      "apiKey": "1892de611537491eae15e337592e5723"
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
      "country": "eg",
      "category": "science",
      "apiKey": "1892de611537491eae15e337592e5723"
    });
    var response = await http.get(url);

    List getAllNews = [];

    Map data = jsonDecode(response.body);
    for (var item in data['articles']) {
      getAllNews.add(item);
    }
    return NewsModel.NewsFromSnapshot(getAllNews);
  }
}
