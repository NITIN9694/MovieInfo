import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:movieapp/model/movie.dart';

 Future <List<Movie>?> getMovie ()async{
  Uri url =Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=ff10b10942750d4c42d1dad007760bf6");
  final response = await http.get(url);  
  print(response);
  if(response.statusCode ==200){
   Map<String,dynamic> map = json.decode(response.body) ;
   List _result =map["results"];
List<Movie>_movielist=_result.map((jsonData) =>Movie.fromJson(jsonData) ).toList();
    return _movielist;
   
  }else{

    print("errror");
    return [];
  }
}

 Future <List<Movie>?> getUpcomig ()async{
  Uri url =Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=ff10b10942750d4c42d1dad007760bf6");
  final response = await http.get(url);  
  print(response);
  if(response.statusCode ==200){
   Map<String,dynamic> map = json.decode(response.body) ;
   List _result =map["results"];
List<Movie>_movielist=_result.map((jsonData) =>Movie.fromJson(jsonData) ).toList();
    return _movielist;
   
  }else{

    print("errror");
    return [];
  }
}

 Future <List<TVshowModel>?> getTvshow ()async{
  Uri url =Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=ff10b10942750d4c42d1dad007760bf6");
  final response = await http.get(url);  
  print(response);
  if(response.statusCode ==200){
   Map<String,dynamic> map = json.decode(response.body) ;
   List _result =map["results"];
List<TVshowModel>_tvshow=_result.map((jsonData) =>TVshowModel.fromJson(jsonData) ).toList();
    return  _tvshow;
   
  }else{

    print("errror");
    return [];
  }
}


