import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newstask/features/news/domain/entities/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  final ArticleEntity article;
  const ArticleDetails(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(imageUrl: article.image!),
              const Gap(10),
              Text(
                article.headline ?? '',
                style: textTheme.titleLarge,
              ),
              const Gap(10),
              Text(
                'Sourec : ${article.source}',
                style: textTheme.titleSmall,
              ),
              const Gap(10),
              Text(
                article.summary ?? '',
                style: textTheme.bodyMedium,
              ),
              const Gap(10),
              TextButton(
                  onPressed: () {
                    if (article.url == null) {
                      return;
                    }
                    launchUrl(Uri.parse(article.url!));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Visit the site'))
            ],
          ),
        ),
      ),
    );
  }
}
