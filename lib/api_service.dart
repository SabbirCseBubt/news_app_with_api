import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app_api/Model/news_model.dart';

class ApiService
{
 final allNewsUrl="https://newsapi.org/v2/everything?q=bitcoin&apiKey=25bae41061cd4c75b2089d06b00a2510";
 final breakingNewsUrl="https://newsapi.org/v2/top-headlines?country=us&apiKey=25bae41061cd4c75b2089d06b00a2510";
 Future<List<NewsModel>> getAllNews()async
 {

   try
   {

     Response response= await get(Uri.parse(allNewsUrl));

     if(response.statusCode==200)
       {
         Map<String ,dynamic> json= jsonDecode(response.body);
         List<dynamic> body=json['articles'];
         List<NewsModel>articlesList =body.map((item) => NewsModel.fromJson(item)).toList();
         return articlesList;


       }
     else
     {
       throw("No news found");



     }




   }
       catch(e)
       {

         throw e;




       }




 }
 Future<List<NewsModel>> getBreakingNews()async
 {

   try
   {

     Response response= await get(Uri.parse(breakingNewsUrl));

     if(response.statusCode==200)
     {
       Map<String ,dynamic> json= jsonDecode(response.body);
       List<dynamic> body=json['articles'];
       List<NewsModel>articlesList =body.map((item) => NewsModel.fromJson(item)).toList();
       return articlesList;


     }
     else
     {
       throw("No news found");



     }




   }
   catch(e)
   {

     throw e;




   }




 }




}