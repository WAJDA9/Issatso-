import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Carousel extends StatefulWidget {
  final List<Image> imgList;
  final CarouselController controller;
  final String title;
  const Carousel({super.key, required this.imgList, required this.controller, required this.title});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.title,
              textAlign: TextAlign.left,
              ),
              CarouselSlider(
            items: widget.imgList,
            carouselController: widget.controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
           Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => widget.controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Color(0xFF6190BA))
                        .withOpacity(_current == entry.key ? 0.9 : 0.3)),
              ),
            );
          }).toList(),
        ),
    ],);
  }
}