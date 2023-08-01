
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/Model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key,required this.newsModel});


  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "Full Details"
      ),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          CachedNetworkImage(
            height: 250,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: widget.newsModel.urlToImage.toString(),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)
                  ),

                  child: Text(widget.newsModel.source!.name.toString())),
              SizedBox(width: 10,),
              Text(widget.newsModel.publishedAt.toString()),
            ],
          ),
          // SizedBox(height: 10,),
          // Text(widget.newsModel.author==null ? " ":widget.newsModel.author.toString()),
          SizedBox(height: 10,),
          Text(widget.newsModel.title==null ? " ":widget.newsModel.title.toString()),
          SizedBox(height: 10,),
          Text(widget.newsModel.title==null ? " ":widget.newsModel.description.toString()),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () async {

            final Uri uri=Uri.parse(widget.newsModel.url.toString());
            if(!await launchUrl(uri))
            {
              throw Exception("Cannot find website");


            }
            else
            {


            }
          }, child: Text("Read More"))

        ],),
      ),
    );
  }
}
