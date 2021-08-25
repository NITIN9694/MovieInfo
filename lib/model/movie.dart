import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Movie with ChangeNotifier {
   String? name;
   String? language;
   bool? isAdult;
   String? description;
   String? posterPath;
   String? backdropath;
   num? rating;
    String ?releaseDate;
     num? id; 


  Movie({
     @required this.name,
     @required this.language, 
     @required this.isAdult,
     @required this.description, 
     @required  this.posterPath, 
     @required  this.backdropath,
     @required   this.rating, 
     @required   this.releaseDate,
     @required  this.id});

     factory Movie.fromJson(Map<String ,dynamic>_json){
       return Movie(
         name:_json["title"] ??"",
         language:_json["original_language"]??"",
         isAdult:_json["adult"]?? "",
          description: _json["overview"]??"",
          posterPath:_json["poster_path"]??"",
          backdropath:_json["backdrop_path"]??"",
           rating:_json["vote_average"]??"",
            releaseDate:_json["release_date"]??"",
            id: _json["id"]??""
            );
     }
     String ? posterUrl(){
     
       return "https://image.tmdb.org/t/p/original/"+posterPath.toString();
     }
     
     String ? background(){
     
       return "https://image.tmdb.org/t/p/original/"+backdropath.toString();
     }
     
} 
class TVshowModel with ChangeNotifier {
   String? name;
   String? language;
   String? country;
   String? description;
   String? posterPath;
   String? backdropath;
   
    String ?releaseDate;
     num? id; 


TVshowModel({
     @required this.name,
     @required this.language, 
     @required this.description, 
     @required  this.posterPath, 
     @required  this.backdropath,
     
     @required   this.releaseDate,
     @required  this.id});

     factory TVshowModel.fromJson(Map<String ,dynamic>_json){
       return TVshowModel(
         name:_json["original_name"] ??"",
         language:_json["original_language"]??"",
         
          description: _json["overview"]??"",
          posterPath:_json["poster_path"]??"",
          backdropath:_json["backdrop_path"]??"",
         
            releaseDate:_json["first_air_date"]??"",
            id: _json["id"]??""
            );
     }
     String ? posterUrl(){
     
       return "https://image.tmdb.org/t/p/original/"+posterPath.toString();
     }
     
     String ? background(){
     
       return "https://image.tmdb.org/t/p/original/"+backdropath.toString();
     }
     
} 