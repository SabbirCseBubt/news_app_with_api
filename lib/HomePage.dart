import 'package:flutter/material.dart';
import 'package:news_app_api/all_news.dart';
import 'package:news_app_api/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(


      appBar:  AppBar(title: Text("Flutter News App"),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
           const Text("Breaking"),
           const Text("All News")


          ],
        ),


      ),

      body: TabBarView(
        children: [
          BreakingNews(),
          AllNews(),
        ],
      ),



    )
    );
  }
}
