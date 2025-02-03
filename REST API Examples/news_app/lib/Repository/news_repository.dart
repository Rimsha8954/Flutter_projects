import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Models/NewsChannelsHeadlinesModel.dart';

import '../Models/CategoriesNewsModel.dart';


class NewsRepository{
  Future<NewsChannelsHeadlinesModel> fetchNewsChannelsHeadlinesApi(String channelName) async{
    String url = 'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=478e5bbebb734a89a8ca9c7890039ce7';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if(response.statusCode == 200){
      return NewsChannelsHeadlinesModel.fromJson(data);
    }
    throw Exception('Failed to load data');
  }


  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=478e5bbebb734a89a8ca9c7890039ce7';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if(response.statusCode == 200){
      return CategoriesNewsModel.fromJson(data);
    }
    throw Exception('Failed to load data');
  }
}