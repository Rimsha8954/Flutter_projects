import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Models/CategoriesNewsModel.dart';
import '../ViewModel/news_view_model.dart';
import 'detail_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MM/dd/yyyy');
  String categoryName = "general";
  List<String> categoriesList = [
    'General',
    'Entertainment',
    'Health',
    'Business',
    'Sport',
    'Technology',
  ];


  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(elevation: 0,),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  categoriesList.length,
                itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  categoryName = categoriesList[index];
                  setState(() {

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      color: categoryName == categoriesList[index] ? Colors.grey : Colors.blueAccent.shade700,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text(categoriesList[index].toString(), style: GoogleFonts.poppins(fontWeight: FontWeight.bold), )),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 12,),
          Expanded(
            child: FutureBuilder<CategoriesNewsModel>(
                future: newsViewModel.fetchCategoriesNewsApi(categoryName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 40,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) {
                          DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                                newsImage: snapshot.data!.articles![index].urlToImage.toString(),
                                newsTitle: snapshot.data!.articles![index].title.toString(),
                                description: snapshot.data!.articles![index].description.toString(),
                                source: snapshot.data!.articles![index].source!.name.toString(),
                                content: snapshot.data!.articles![index].content.toString(),
                                newsDate: format.format(dateTime),
                                author: snapshot.data!.articles![index].author.toString(),
                              )));
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                        fit: BoxFit.cover,
                                        height: height * .18,
                                        width: width * .3,
                                        placeholder: (context, url) => spintkit,
                                        errorWidget: (context, url, error) => Icon(
                                          Icons.error,
                                          color: Colors.red,

                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: height * .18,
                                          padding: EdgeInsets.only(left: 15, ),
                                          child: Column(
                                            children: [
                                              Text(snapshot.data!.articles![index].title.toString(), style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700),maxLines: 3,),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 15.0, right: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(snapshot.data!.articles![index].source!.name.toString(), style: GoogleFonts.poppins(fontSize: 15, color: Colors.blue.shade700, fontWeight: FontWeight.w600),),
                                                    Text(format.format(dateTime), style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),),

                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
      ],),
    );
  }
}

const spintkit = SpinKitFadingCircle(
  color: Colors.white,
  size: 50,
);

