import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:miniprojet/widgets/carrousel.dart';

final List<Image> imgList = [
  Image.asset('assets/news1.png'),
   Image.asset('assets/news2.png'),
  Image.asset('assets/news1.png'),
  Image.asset('assets/news2.png'),

 
];
final List<Image> imgList1 = [
  Image.asset('assets/cours1.png'),
   Image.asset('assets/cours2.png'),
  Image.asset('assets/cours1.png'),
   Image.asset('assets/cours2.png'),

 
];
final List<Image> imgList2 = [
  Image.asset('assets/Group 35.png'),
   Image.asset('assets/Group 36.png'),
     Image.asset('assets/Group 35.png'),
   Image.asset('assets/Group 36.png'),

 
];

class HomeScreenT extends StatefulWidget {
  const HomeScreenT({super.key});

  @override
  State<HomeScreenT> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenT> {
   int _current = 0;
  final CarouselController _controller = CarouselController();
  final CarouselController _controller1 = CarouselController();
  final CarouselController _controller2 = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Welcome Back Dr. Slim"),
                      Icon(Icons.notifications_none_outlined),
                    ],
                  ),
                  margin: EdgeInsets.all(15),     
                  padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  height: 50,
                  
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Carousel(controller: _controller,imgList: imgList,title: "News",),
                Carousel(controller: _controller1,imgList: imgList1,title: "Courses Material",),
                Carousel(controller: _controller2,imgList: imgList2,title: "Upcoming Schedule",),
              ],
            ),
    );
  }
}