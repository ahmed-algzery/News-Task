import 'package:dio/dio.dart';

import 'package:newstask/core/constants/constants.dart';
import 'package:newstask/core/resources/http_response.dart';
import 'package:newstask/features/news/data/data_sources/remote/news_api_service.dart';
import 'package:newstask/features/news/data/models/article.dart';

class NewsApiServiceImpl implements NewsApiService {
  NewsApiServiceImpl(this.dio);

  final Dio dio;

  @override
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    required String apiKey,
    required String category,
  }) async {
    final response = await dio.get(
      '$newsAPIBaseURL/news?category=$category&token=$apiKey',
    );

    List<ArticleModel> value = (response.data as List)
        .map<ArticleModel>(
          (dynamic item) => ArticleModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    final httpResponse = HttpResponse(value, response);
    return httpResponse;
  }
}
