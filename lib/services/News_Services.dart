// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:news/models/artecal_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);
  Future<List<ArtecalModel>> getNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=2de4b59ddfcd4444ba9b8ea5372b316a#');
    var jesonData = response.data;
    List artices = jesonData["articles"];
    List<ArtecalModel> artecalList = [];

    for (var artecal in artices) {
      ArtecalModel artecalModel = ArtecalModel(
        image: artecal['urlToImage'],
        tittle: artecal['title'],
        SubTittle: artecal['description'],
      );
      artecalList.add(artecalModel);
    }
    return artecalList;
  }
}
