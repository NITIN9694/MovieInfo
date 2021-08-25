import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Widget/getData.dart';
import 'package:movieapp/model/Search_categoery.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/pages/Moviedetail.dart';
import 'package:movieapp/pages/TVshowDetail.dart';


class HomePage extends StatefulWidget {
  static const routName ='/Homepage';
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? _searchcontrolle;
  List<Movie> ? movielist;
  List<Movie> ? movielist2;
  List<TVshowModel>?tvshow ;
  bool isloding =false;
  bool ismovie=false;
  bool istvshow=false;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovie().then((value) {
        setState(() {
          if(value!.isNotEmpty){
           movielist=value;
            isloding =true;
            
          }else{
            print("List is Empty");
          }
        });
    });
     getUpcomig().then((value) {
        setState(() {
          if(value!.isNotEmpty){
           movielist2=value;
            ismovie =true;
          
          }else{
            print("List is Empty");
          }
        });
    });
    getTvshow().then((value) {
      setState(() {
        if(value!.isNotEmpty){
          tvshow =value;
          print(tvshow);
          istvshow =true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
     double ?_deviceHeight =MediaQuery.of(context).size.height;
  double ?_deviceWidth= MediaQuery.of(context).size.width;
      final Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Color.fromRGBO(34, 36, 70, 0.5),
      body:  Container(
          height: _deviceHeight,
          width: _deviceWidth,
          child:  Stack(children: [
             _backgroundWidget(),
            
             Padding(
              padding: EdgeInsets.only(top: _deviceHeight*0.05,left: _deviceWidth*0.06),
               child: SingleChildScrollView(
                 child: Column(
                     children: [
                        Container(
                          width: _deviceWidth,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                                CarouselSlider(
                                  items: [
                                       
                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/image/p1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                  //2nd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/image/p4.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/image/p3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                  //4th Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/image/p2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                 
                                  ],
                                   options:  CarouselOptions(
                                         
                                          
                                          enlargeCenterPage: true,
                                          autoPlay: true,
                                          aspectRatio: 16 / 10,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enableInfiniteScroll: true,
                                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                                          viewportFraction: 0.8,
                                        ),)
                            ],
                          ),
                        ),
                       
                       SizedBox(
                         height: _deviceHeight*0.05,
                       ),
                            ismovie? Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start
                       ,
                       children: [
                         Text(" Popular",style: TextStyle(color: Colors.white,
                         fontSize: _deviceHeight*0.034
                         ),),
                         SizedBox(
                           height: _deviceHeight*0.015,
                         ),
                         Container(
                           height: _deviceHeight*0.3,
                           width:_deviceWidth*5,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                                 itemCount: movielist!.length,
                                 itemBuilder: (context,index){
                                   return  _Popular(context, movielist![index]);
                                 }),
                         ),
                       ],
                     
                   ):Container(
                     child: Center(
                       child: CircularProgressIndicator(color: Colors.white,),
                      ),
                   ),
                   ismovie? Padding(
                     padding:  EdgeInsets.only(top: _deviceHeight*0.05),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start
                       ,
                       children: [
                         Text("UpComing",style: TextStyle(color: Colors.white,
                         fontSize: _deviceHeight*0.034
                         ),),
                          SizedBox(
                           height: _deviceHeight*0.015,
                         ),
                         Container(
                           height: _deviceHeight*0.3,
                           width:_deviceWidth*5,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                                 itemCount: movielist2!.length,
                                 itemBuilder: (context,index){
                                   return  _UpComing(context, movielist2![index]);
                                 }),
                         ),
                         
                       ],
                     ),
                   ):Container(
                     child: Center(
                       child: CircularProgressIndicator(color: Colors.white,),
                      ),
                   ),
                       istvshow?  Padding(
                     padding:  EdgeInsets.only(top: _deviceHeight*0.05),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start
                       ,
                       children: [
                         Text("TVshows",style: TextStyle(color: Colors.white,
                         fontSize: _deviceHeight*0.034
                         ),),
                          SizedBox(
                           height: _deviceHeight*0.015,
                         ),
                         Container(
                           height: _deviceHeight*0.3,
                           width:_deviceWidth*5,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                                 itemCount: tvshow!.length,
                                 itemBuilder: (context,index){
                                   return  _TVShow(context, tvshow![index]);
                                 }),
                         ),
                         
                       ],
                     ),
                   ): Container(
                     child: Center(
                       child: CircularProgressIndicator(color: Colors.white,),
                      ),
                   ),
                     ],
                   ),
                 ),
               ),
             
             
                  
              ]),
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
      image:DecorationImage(image: AssetImage("assets/image/splash.png"),fit: BoxFit.cover,),
    ),
    child: BackdropFilter(
      filter:ImageFilter.blur(sigmaX: 15.0,sigmaY: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4)
        ),
      ),
    ),
    );
  }
  
  //  Widget image_carousel = new Container(
  //     height: 200.0,
  //     child:  new Carousel(
  //       boxFit: BoxFit.cover,
  //       images: [
  //         AssetImage('assets/image/p1.jpg'),
  //         AssetImage('assets/image/p4.jpg'),
  //         AssetImage('assets/image/p2.jpg'),
  //         AssetImage('assets/image/p3.jpg'),
         
  //       ],
  //       autoplay: true,
  //    animationCurve: Curves.fastOutSlowIn,
  //    animationDuration: Duration(milliseconds: 5),
  //       dotSize: 4.0,
  //       indicatorBgPadding: 2.0,
  //     ),
  //   );

  Widget _forgroundwidget(){
        double ?_deviceHeight =MediaQuery.of(context).size.height;
  double ?_deviceWidth= MediaQuery.of(context).size.width;
  final _border = InputBorder.none;
    return Container(
    padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0,0),
    width: _deviceWidth*0.88,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Padding(
      padding:  EdgeInsets.only(left:_deviceWidth*0.08,
      top: _deviceHeight*0.05
      ),
      child: Container(
   height: _deviceHeight*0.08,
   width: _deviceWidth*2,
   decoration: BoxDecoration(
       color: Colors.black54,
       borderRadius: BorderRadius.circular(20)
   )
   ,child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       mainAxisSize: MainAxisSize.max,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Container(
       height:_deviceHeight*0.05,
       width: _deviceWidth*0.50,
       child: TextField(
         controller: _searchcontrolle,
         onSubmitted: (input){},
         style: TextStyle(color: Colors.white),
         decoration: InputDecoration(
           focusedBorder: _border,
           border: _border,
           prefixIcon: Icon(Icons.search,color: Colors.white24,),
           hintStyle: TextStyle(color: Colors.white24),
           filled: false,
           fillColor: Colors.white24,
           hintText: "Search...."
         ),
       ),
    ),
       ],
   ),
      ),
    )
         
       ],
    ),
    );
  }
Widget _Popular( BuildContext context,Movie model ){
  return  Padding(
    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(title: model.name, disc: model.description, poster: model.posterUrl(), backgrounfposter: model.background(), rating: model.rating.toString(), adult: model.isAdult, releasdeDate: model.releaseDate, language: model.language) ));
          },
          child: Container(
            
            height: MediaQuery.of(context).size.height*0.25,
           width: MediaQuery.of(context).size.width*0.4,  
             child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(40),
               ),
               child: Image.network(model.posterUrl().toString(),fit: BoxFit.contain,),
             )
            ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
        Row(
          children: [
            Text(model.name.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            maxLines: 1
            ,),
             SizedBox(
          width: MediaQuery.of(context).size.width*0.02,
        ),
            Text(model.rating.toString(),style: TextStyle(color: Colors.white),),
             SizedBox(
        width: MediaQuery.of(context).size.width*0.005,
        ),
            Icon(Icons.star,color: Colors.yellow,size:MediaQuery.of(context).size.width*0.04,)
          ],
        )
      ],
    ),
  );
}
Widget _UpComing( BuildContext context,Movie model ){
  return  Padding(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(title: model.name, disc: model.description, poster: model.posterUrl(), backgrounfposter: model.background(), rating: model.rating.toString(), adult: model.isAdult, releasdeDate: model.releaseDate, language: model.language) ));
      },
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
    
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
           width: MediaQuery.of(context).size.width*0.4,  
             child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(40),
               ),
               child: Image.network(model.posterUrl()!.toString(),fit: BoxFit.contain,),
             )
            ],
            ),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
       
              Text(model.name.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              maxLines: 1
              ),
        ],
      ),
    ),
  );
}

Widget _TVShow( BuildContext context,TVshowModel model ){
  return  Padding(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TVshowDetail(title: model.name, disc: model.description, poster: model.posterUrl(), backgrounfposter: model.background().toString(), releasdeDate: model.releaseDate, language: model.language)));
      },
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
    
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
           width: MediaQuery.of(context).size.width*0.4,  
             child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(40),
               ),
               child: Image.network(model.posterUrl()!.toString(),fit: BoxFit.contain,),
             )
            ],
            ),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ), Text(model.name.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              maxLines: 1
              ),
        ],
      ),
    ),
  );
}
}

  