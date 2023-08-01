import 'package:flutter/material.dart';
import 'package:news_app_api/Model/news_model.dart';
import 'package:news_app_api/api_service.dart';
import 'package:news_app_api/news_itemList.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

  ApiService apiService =ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(

          future: apiService.getAllNews(),
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
