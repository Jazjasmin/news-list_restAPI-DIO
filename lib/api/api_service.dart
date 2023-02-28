import 'package:dio/dio.dart';
import 'package:news_api/api/news_model.dart';

class NewsApiService {
   static const String _apikey = "1dd65a9b98404f4b9e07578cc63b32d7";
   String _url = "https://newsapi.org/v2/top-headlines?country=in&category=sport&apiKey=$_apikey";
   Dio _dio = Dio();

//http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=1dd65a9b98404f4b9e07578cc63b32d7


   Future<List<Articles>> fetchNewsArticle() async {
     try{
       Response response = await _dio.get(_url);
       NewsModel newsModel =NewsModel.fromJson(response.data);
       return newsModel.articles!;
     }on DioError catch(e){
       print(e);
       rethrow;
     }

   }
}