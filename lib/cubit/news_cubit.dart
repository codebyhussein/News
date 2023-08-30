// import 'dart:convert';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// import 'package:http/http.dart' as http;
// import 'package:news/models/news_model/news_model.dart';

// part 'news_state.dart';

// class NewsCubit extends Cubit<NewsState> {
//   NewsCubit() : super(NewsInitial());

//   Future<List<NewsModel>> get() async {
//     try {
//       emit(getAllNewsLoading());
//       var url = Uri.https('newsapi.org', 'v2/everything',
//           {"q": "bitcoin", "apiKey": "1892de611537491eae15e337592e5723"});
//       var response = await http.get(url);

//       List getAllNews = [];

//       Map Data = jsonDecode(response.body);
//       for (var item in Data['articles']) {
//         getAllNews.add(item);
//       }

//       return NewsModel.NewsFromSnapshot(getAllNews);
//       emit(getAllNewsSuccess());
//     } catch (e) {
//       emit(getAllNewsFailure(errorMassege: e.toString()));
//     }
//     return [];
//   }
// }
