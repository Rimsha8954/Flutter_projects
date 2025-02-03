import 'package:news_app/Models/NewsChannelsHeadlinesModel.dart';
import 'package:news_app/Repository/news_repository.dart';

import '../Models/CategoriesNewsModel.dart';

class NewsViewModel{
  final NewsRepository _repo = NewsRepository();

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelsHeadlinesApi(String channelName) async{
    final response = await _repo.fetchNewsChannelsHeadlinesApi(channelName);
    return response;
  }


  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    final response = await _repo.fetchCategoriesNewsApi(category);
    return response;
  }
}