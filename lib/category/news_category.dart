import 'package:flutter/material.dart';
import 'package:news_api/api/api_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_api/api/news_model.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articles>>(
        future: NewsApiService().fetchNewsArticle(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Articles> newsArticle = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: newsArticle.length,
              itemBuilder: (context, index) {
                return NewsTile(article: newsArticle[index]);
              },
            );
          }
        });
  } 
}

class NewsTile extends StatelessWidget {
  final Articles article;
   const NewsTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: ListTile(
        onTap: () async {
          await canLaunch(article.url!)
              ? await launch(article.url!,
              forceSafariVC:false,
              forceWebView: false,
              )
              : throw 'Could not launch ${article.url}';
        },
        title: article.urlToImage != null ?
        Text(
          article.title!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ):null,
        subtitle: Text(
          article.description!,
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.normal),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        leading: article.urlToImage != null
            ? Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage!),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
