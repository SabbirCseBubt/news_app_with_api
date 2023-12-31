import 'package:flutter/material.dart';
import 'package:news_app_api/Model/news_model.dart';
import 'package:news_app_api/api_service.dart';
import 'package:news_app_api/news_itemList.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

  ApiService apiService =ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(

          future: apiService.getBreakingNews(),
          builder: (context ,snapshot)
          {


            if(snapshot.hasData)
            {
              List<NewsModel>articleList=snapshot.data ?? [];
              return ListView.builder(

                  itemCount: articleList.length,
                  itemBuilder: (context,index)
                  {

                   return NewsItemList(newsModel: articleList[index],);

                  });



            }

            return Center(child: CircularProgressIndicator(

            ),);


          }




      ),

    );
  }
}
