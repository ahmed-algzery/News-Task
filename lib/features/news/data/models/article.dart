import '../../../../core/constants/constants.dart';
import '../../domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.category,
    super.datetime,
    super.headline,
    super.image,
    super.source,
    super.summary,
    super.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'],
      category: map['category'] ?? "",
      datetime: map['datetime'] ?? 0, 
      headline: map['headline'] ?? "",
      image: map['image'] != null && map['image'] != "" ? map['image'] : kDefaultImage,
      source: map['source'] ?? "",
      summary: map['summary'] ?? "",
      url: map['url'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      category: entity.category,
      datetime: entity.datetime,
      headline: entity.headline,
      image: entity.image,
      source: entity.source,
      summary: entity.summary,
      url: entity.url,
    );
  }
}
