import 'package:flutter/material.dart';
import 'package:news_blog_flutter_app/components/custom_list_style.dart';
import 'package:news_blog_flutter_app/model/article_model.dart';
import 'package:news_blog_flutter_app/services/api_services.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Articles>> snapshot) {
            if (snapshot.hasData) {
              List<Articles>? articles = snapshot.data;
              return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index) =>
                    customListTile(articles?[index]??Articles()),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
