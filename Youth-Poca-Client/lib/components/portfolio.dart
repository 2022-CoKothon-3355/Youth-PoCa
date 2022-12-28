import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youth_poca/commons/common_form_portfolio.dart';

class Portfolio extends StatefulWidget {
  final List<String> images;
  final List<String> content;
  final String result;

  const Portfolio(
      {required this.images, required this.content, required this.result});

  @override
  State<Portfolio> createState() => _PortfolioState(images, content, result);
}

class _PortfolioState extends State<Portfolio> {
  final images;
  final content;
  final result;

  _PortfolioState(this.images, this.content, this.result);
  @override
  Widget build(BuildContext context) {
    print(images[0]);
    late Color mColor;
    if (images[0] == "1") {
      mColor = Colors.grey;
    } else if (images[0] == "2") {
      mColor = Colors.black;
    } else if (images[0] == "3") {
      mColor = Colors.red;
    }
    final Mheight = MediaQuery.of(context).size.height;
    List<Widget> portNum = [
      CommonFormPortfolio(image: images, content: content, color: mColor),
      CommonFormPortfolio(image: images, content: content, color: mColor),
    ];
    return CarouselSlider(
      items: portNum,
      options: CarouselOptions(
        height: Mheight * 0.7,
        autoPlay: false,
        //padEnds: false,
        autoPlayInterval: const Duration(seconds: 10),
        initialPage: 0,
        viewportFraction: 1,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {
          setState(
            () {},
          );
        },
      ),
    );
    //CommonFormPortfolio(image: images, content: content);
  }
}
