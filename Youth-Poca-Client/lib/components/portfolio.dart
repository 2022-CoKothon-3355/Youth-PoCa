import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youth_poca/commons/common_form_portfolio.dart';

class Portfolio extends StatefulWidget {
  final List<dynamic>? images;
  final List<dynamic>? content;
  final String? result;
  final int index;

  const Portfolio(
      {this.images, this.content, this.result, required this.index});

  @override
  State<Portfolio> createState() =>
      _PortfolioState(images, content, result, index);
}

class _PortfolioState extends State<Portfolio> {
  final images;
  final content;
  final result;
  final index;
  _PortfolioState(this.images, this.content, this.result, this.index);
  @override
  Widget build(BuildContext context) {
    final Mheight = MediaQuery.of(context).size.height;
    List<Widget> portNum = [
      CommonFormPortfolio(image: images, content: content),
      CommonFormPortfolio(image: images, content: content),
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
