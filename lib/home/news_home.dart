import 'package:flutter/material.dart';
import 'package:news_api/api/api_service.dart';
import 'package:news_api/api/news_model.dart';


class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
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
    return 
    Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [   
          Text(article.publishedAt!),
          Container(
            height: 175,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(article.urlToImage!),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            child: article.author!=null ?
            Text(article.author!,
            style: const TextStyle(fontWeight: FontWeight.bold),
            ): null,
          ),
          ListTile( 
              title: Text(
                article.title!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ), 
              subtitle: Text(
                article.description!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
      
    );
  }
}
