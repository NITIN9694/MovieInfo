import 'dart:ui';

import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  static const routname ="MovieDetails";
  String? title;
  String? disc;
  String? poster;
  String? backgrounfposter;
  String? rating;
  bool? adult;
  String? releasdeDate;
  String? language;
   MovieDetail({
    Key? key,
    required this.title,
    required this.disc,
    required this.poster,
    required this.backgrounfposter,
    required this.rating,
    required this.adult,
    required this.releasdeDate,
    required this.language,
  }) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
     double ?_deviceHeight =MediaQuery.of(context).size.height;
  double ?_deviceWidth= MediaQuery.of(context).size.width;
    return Hero(
      tag:'poster' ,
      child: SafeArea(
        child: Scaffold(
           body:  Stack(
             children: [
               _backgroundWidget(),
               Container(
      
                 height: _deviceHeight*0.7,
                 width: _deviceWidth,
                 
               child: Image.network(widget.poster.toString(),fit: BoxFit.cover,)),
      
               Padding(
                 padding:  EdgeInsets.only(top:_deviceHeight*0.7),
                 child: Container(
                   height: _deviceHeight*0.4,
                   width: _deviceWidth,
                   decoration: BoxDecoration(
                     color: Colors.black54
                   ),
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(
                         height: _deviceHeight*0.02,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.language.toString().toUpperCase(),style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: _deviceHeight*0.02
                       )),
                          Text(widget.title.toString(),style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: _deviceHeight*0.03
                       ),),
                       Row(
                         children: [
                           Text(widget.rating.toString(),style: TextStyle(
                             color: Colors.white,
                              fontWeight: FontWeight.bold,
                         fontSize: _deviceHeight*0.02
                           ),),
                           Icon(Icons.star,color: Colors.yellow,)
                         ],
                       ),
                        ],
                       ),
                        SizedBox(
                         height: _deviceHeight*0.02,
                       ),
                           Text(widget.disc.toString(),style: TextStyle(
                             color: Colors.white
                           ),),
                            SizedBox(
                         height: _deviceHeight*0.02,
                       ),
                         Row(
                           children: [
                             Text("Date ",style: TextStyle(
                                 color: Colors.white
                               ),),
                             Text(widget.releasdeDate.toString(),style: TextStyle(
                                 color: Colors.white
                               ),),
                           ],
                         ),
                         
                     ],
                   ),
                 ),
                 
               )
             ],
           ),
        ),
      ),
    );
  }
   Widget _backgroundWidget(){
// ignore: unused_local_variable
double ?_deviceHeight =MediaQuery.of(context).size.height;
  // ignore: unused_local_variable
  double ?_deviceWidth= MediaQuery.of(context).size.width;
    return Container(
    decoration:BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image:DecorationImage(image: NetworkImage(widget.backgrounfposter.toString(),),fit: BoxFit.cover),
    ),
    child: BackdropFilter(
      filter:ImageFilter.blur(sigmaX: 15.0,sigmaY: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2)
        ),
      ),
    ),
    );
  }
}