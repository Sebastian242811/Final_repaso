import 'package:http/http.dart' as http;
import 'package:flutterapprepaso/models/movie.dart';
import 'dart:convert';
import 'dart:io';

class HttpHelper{
  //final String url ='api.themoviedb.org/3/movie/upcoming?api_key=3cae426b920b29ed2fb1c0749f258325';

  final String urlBase = 'api.themoviedb.org/3/movie/';
  final String urlUpcoming = 'upcoming?';
  final String urlKey = 'api_key=3cae426b920b29ed2fb1c0749f258325';
  final String urlPage = '&page=';

  Future<List> getUpcoming(String page) async{
    final String upcoming =urlBase + urlUpcoming + urlKey + urlPage +page;
    http.Response result =await http.get(upcoming);

    if(result.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];

      List movies = moviesMap.map((i)=>Movie.fromJson(i)).toList();
      return movies;
    }
    else{
      return null;
    }
  }
}