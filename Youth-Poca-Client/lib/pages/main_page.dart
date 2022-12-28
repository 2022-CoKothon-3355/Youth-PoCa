import 'package:flutter/material.dart';
import 'package:youth_poca/commons/common_form_card.dart';
import 'package:youth_poca/components/card_slider.dart';

import '../components/portfolio.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const name = "최보석";
    const email = "1234@naver.com";
    const phoneNum = "010-1234-5678";
    const address = "www.github.com/1234";
    const activity = "프론트엔드";
    const progress = "진행상황";
    const description = "한줄요약";

    return Scaffold(
      body: Column(
        children: [
          Portfolio(images: [], content: [], result: ""),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.7,
          // ),
          CardSlider(),
        ],
      ),
    );
  }
}