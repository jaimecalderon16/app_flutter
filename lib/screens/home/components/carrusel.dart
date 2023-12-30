import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {

    return FlutterCarousel(
      options: CarouselOptions(
        height: 190.0,
        aspectRatio: 40 / 9, 
        showIndicator: true,
        viewportFraction: 1,
        slideIndicator: const  CircularSlideIndicator(
          indicatorBackgroundColor: Color(0xFFE1E1E1),
          currentIndicatorColor: Color(0xFFA7A6A6),
          alignment : Alignment.bottomRight,
          padding: EdgeInsets.only(right: 8),
          ),
        enableInfiniteScroll : true,
        autoPlay: true,
        floatingIndicator: false,
        autoPlayAnimationDuration: const Duration(seconds: 1),
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return  Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration:  BoxDecoration(
                color: Colors.amber,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius:  BorderRadius.circular(25),
                child: Image.asset(
                i,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,)
              )
            );
          },
        );
      }).toList(),
    );
  }
}