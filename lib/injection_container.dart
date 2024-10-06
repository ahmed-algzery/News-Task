import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:newstask/features/news/data/data_sources/remote/news_api_service.dart';
import 'package:newstask/features/news/data/data_sources/remote/news_api_service_impl.dart';
import 'package:newstask/features/news/data/repositories/article_repository_impl.dart';
import 'package:newstask/features/news/domain/repository/article_repository.dart';
import 'package:newstask/features/news/domain/usecases/get_article.dart';
import 'package:newstask/features/news/presentation/bloc/article/remote_article_bloc.dart';

final locator = GetIt.instance;

Future<void> intializeDependecies() async {
  locator.registerSingleton<Dio>(Dio());

  locator.registerSingleton<NewsApiService>(NewsApiServiceImpl(locator()));

  locator.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(locator()));

  locator.registerSingleton<GetArticleUseCase>(GetArticleUseCase(locator()));

  locator.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(locator()),
  );
}
