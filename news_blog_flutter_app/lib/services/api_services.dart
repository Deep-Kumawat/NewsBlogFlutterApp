import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_blog_flutter_app/model/article_model.dart';
class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
Future<List<Articles>> getArticle() async {
    
    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': 'cf9a34cfa18242f5a2a21164ec8495cb'
    };
final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Articles> articles = body.map((dynamic item) => Articles.fromJson(item)).toList();
    return articles;
  }
}