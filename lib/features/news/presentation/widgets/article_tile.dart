import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:newstask/core/constants/constants.dart';
import 'package:newstask/core/util/responsive_utils.dart';
import 'package:newstask/features/news/domain/entities/article.dart';
import 'package:newstask/features/news/presentation/pages/article_details/article_details.dart'; // Import for date formatting

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;
  const ArticleTile({required this.article, super.key});

  // Helper method to format the datetime field
  String formatDateTime(int? timestamp) {
    if (timestamp == null || timestamp == 0) {
      return 'Unknown date';
    }
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000); // Convert to DateTime
    return DateFormat.yMMMd().add_jm().format(dateTime); // Format date and time
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleDetails(article),
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                spreadRadius: 2,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: article.image ?? kDefaultImage,
                height: h(context, 0.2),
                width: w(context, 1),
                fit: BoxFit.fill,
              ),
              const Gap(10),
              Text(
                article.headline ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(10),
              Text(
                article.summary ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Gap(10),
              // Source and Date/Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.source ?? 'Unknown source',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formatDateTime(article.datetime),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
