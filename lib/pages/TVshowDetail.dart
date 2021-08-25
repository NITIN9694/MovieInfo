import 'dart:ui';

import 'package:flutter/material.dart';

class TVshowDetail extends StatefulWidget {

  String? title;
  String? disc;
  String? poster;
  String? backgrounfposter;
  
  String? releasdeDate;
  String? language;
   TVshowDetail({
    Key? key,
    required this.title,
    required this.disc,
    required this.poster,
    required this.backgrounfposter,
  
    required this.releasdeDate,
    required this.language,
  }) : super(key: key);

  @override
  _TVshowDetailState createState() => _TVshowDetailState();
}

class _TVshowDetailState extends State<TVshowDetail> {
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
               Image.network(widget.poster.toString()),
                 Padding(
                   padding:  EdgeInsets.only(top:_deviceHeight*0.7),
                   child: Container(
                     height: _deviceHeight*0.4,
                     width: _deviceWidth,
                     decoration: BoxDecoration(
                       color: Colors.black54
                     ),
                     child:SingleChildScrollView(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             height: _deviceHeight*0.025,
                           ),
                           Row(
                            
                            children: [
                              Text(widget.language.toString().toUpperCase(),style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: _deviceHeight*0.02
                           )),
                           SizedBox(
                             width: _deviceWidth*0.2,
                           ),
                              Text(widget.title.toString(),style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: _deviceHeight*0.03
                           ),),
                          
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
      image:DecorationImage(image: NetworkImage(widget.backgrounfposter.toString(),),fit: BoxFit.cover, scale: 1.0),
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