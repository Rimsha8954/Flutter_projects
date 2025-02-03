import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {

  final String newsImage, newsTitle, newsDate, description, content, source, author;
   const DetailScreen({super.key, required this.newsImage, required this.newsTitle, required this.description,required this.source,required this.content,required this.newsDate, required this.author});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
              height: height * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                child: CachedNetworkImage(
                    imageUrl: widget.newsImage,
                  fit: BoxFit.fill,
                   placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                ),
              ),

            ),
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height * .4),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: ListView(
              children: [
                Text(widget.newsTitle, style: GoogleFonts.poppins(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                SizedBox(height: height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.author, style: GoogleFonts.poppins(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.w600),),
                    Text(widget.newsDate, style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(height: height * 0.03,),
                Text(widget.description, style: GoogleFonts.poppins(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),),

                Text(widget.content, style: GoogleFonts.poppins(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
