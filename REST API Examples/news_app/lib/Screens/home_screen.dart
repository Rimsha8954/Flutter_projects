import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Models/NewsChannelsHeadlinesModel.dart';
import 'package:news_app/Screens/detail_screen.dart';
import 'package:news_app/ViewModel/news_view_model.dart';
import '../Models/CategoriesNewsModel.dart';
import '../Reuseable Widget/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MM/dd/yyyy');
  String name = "bbc-news";
  FilterList? selectedMenu;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: Colors.black,
        appBar: CustomAppBar(
          selectedMenu: selectedMenu,
          onFilterSelected: (FilterList item) {
            setState(() {
              if(FilterList.bbcNews.name == item.name){
                name = 'bbc-news';
              }else if(FilterList.aryNews.name == item.name){
                name = 'ary-news';
              }else if(FilterList.alJazeera.name == item.name){
                name = 'al-jazeera-english';
              }else if(FilterList.cnn.name == item.name){
                name = 'cnn';
              }else if(FilterList.independent.name == item.name){
                name = 'independent';
              }

              selectedMenu = item;
            });

          },
        ),
        body: ListView(
          children: [
            SizedBox(
              height: height * .5,
              width: width,
              child: FutureBuilder<NewsChannelsHeadlinesModel>(
                  future: newsViewModel.fetchNewsChannelsHeadlinesApi(name),
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
                          scrollDirection: Axis.horizontal,
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
                              child: SizedBox(
                                child: Stack(
                                  children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: width * .05),
                                    child: Container(
                                      height: height * 0.5,
                                      width: width * 0.9,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot
                                              .data!.articles![index].urlToImage
                                              .toString(),
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => spintkit,
                                          errorWidget: (context, url, error) => Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                   Positioned(
                                     bottom: 15,
                                     left: 40,
                                     child: Card(
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(20),
                                       ),
                                       color: Colors.black,
                                       child: Container(
                                         alignment: Alignment.center,
                                         height: height * 0.22,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding:  EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
                                               child: Container(
                                                 width: width * 0.7,
                                                 child: Text(snapshot.data!.articles![index].title.toString(),
                                                 style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
                                                   maxLines: 3,
                                                   overflow: TextOverflow.ellipsis,
                                                 ),
                                               ),
                                             ),
                                             Spacer(),
                                             Padding(
                                               padding: const EdgeInsets.only(bottom: 15.0),
                                               child: Container(
                                                 width: width * 0.7,
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children: [
                                                     Text(snapshot.data!.articles![index].source!.name.toString(),
                                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w800, fontSize: 14, color: Colors.blue,),
                                                     ),
                                                     Text(format.format(dateTime),
                                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white ),
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                              
                                       ),
                                     ),
                                   ),
                                ]
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder<CategoriesNewsModel>(
                  future: newsViewModel.fetchCategoriesNewsApi('General'),
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
                        shrinkWrap: true,
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
                                                  padding: const EdgeInsets.only(bottom: 15.0, right: 5),
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
          ],
        ),
    );
  }
}

const spintkit = SpinKitFadingCircle(
  color: Colors.white,
  size: 50,
);
