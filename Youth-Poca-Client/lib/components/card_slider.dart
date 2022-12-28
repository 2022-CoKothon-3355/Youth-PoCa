import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youth_poca/components/portfolio.dart';
import '../commons/common_form_card.dart';
import '../commons/common_form_portfolio.dart';

class CardSlider extends StatefulWidget {
  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  static const name = "최보석";
  static const email = "1234@naver.com";
  static const phoneNum = "010-1234-5678";
  static const address = "www.github.com/1234";
  static const activity = "프론트엔드 / 코코톤";
  static const progress = "진행상황";
  static const description = "한줄요약";
  final isRepre = false;
  static const image = ["1", "2", "3"];
  static const content = ["1", "2", "3"];
  String i = image[0];
  String c = content[0];
  @override
  Widget build(BuildContext context) {
    final Mheight = MediaQuery.of(context).size.height;
    List<Widget> pocaNum = [
      CommonFormCard(
          name: name,
          activity: activity,
          address: address,
          description: description,
          email: email,
          phoneNum: phoneNum,
          progress: progress,
          isRepresent: isRepre),
      CommonFormCard(
        name: name,
        activity: activity,
        address: address,
        description: description,
        email: email,
        phoneNum: phoneNum,
        progress: progress,
        isRepresent: !isRepre,
      ),
      CommonFormCard(
        name: name,
        activity: activity,
        address: address,
        description: description,
        email: email,
        phoneNum: phoneNum,
        progress: progress,
        isRepresent: isRepre,
      ),
    ];
    print(c);
    print(i);
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _PortfolioView([i]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CarouselSlider(
            items: pocaNum,
            options: CarouselOptions(
              height: Mheight * 0.3,
              autoPlay: false,
              //padEnds: false,
              autoPlayInterval: const Duration(seconds: 10),
              initialPage: 0,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              scrollDirection: Axis.vertical,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    i = image[index];
                    c = content[index];
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  _PortfolioView(List<String> images) {
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
    List<Widget> portNum = [];
    portNum = [
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
  }
}
