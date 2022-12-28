import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../commons/common_form_card.dart';

class CardSlider extends StatefulWidget {
  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  @override
  Widget build(BuildContext context) {
    final Mheight = MediaQuery.of(context).size.height;
    const name = "최보석";
    const email = "1234@naver.com";
    const phoneNum = "010-1234-5678";
    const address = "www.github.com/1234";
    const activity = "프론트엔드 / 코코톤";
    const progress = "진행상황";
    const description = "한줄요약";
    final isRepre = false;

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
        isRepresent: false,
      ),
    ];
    return Padding(
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
              () {},
            );
          },
        ),
      ),
    );
  }
}
