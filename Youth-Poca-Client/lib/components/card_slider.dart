import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youth_poca/components/portfolio.dart';
import '../commons/common_form_card.dart';
import '../commons/poca_num_list.dart';
import '../model/poca_info.dart';

class CardSlider extends StatefulWidget {
  final PocaInfo? model;
  final int modelLen;

  const CardSlider({this.model, required this.modelLen});
  @override
  State<CardSlider> createState() => _CardSliderState(model, modelLen);
}

class _CardSliderState extends State<CardSlider> {
  final PocaInfo? model;
  final int modelLen;
  _CardSliderState(this.model, this.modelLen);
  @override
  Widget build(BuildContext context) {
    final Mheight = MediaQuery.of(context).size.height;

    final name = model?.name;
    final email = model?.email;
    final phoneNum = model?.phoneNum;
    final address = model?.address;
    final activity = model?.activity;
    final progress = model?.progress;
    final description = model?.description;
    //final bool? isRepre = model?.isRepresent;
    final images = model?.images;
    final content = model?.contents;
    final result = model?.result;

    if (pocaNum.length < modelLen) {
      pocaNum.add(
        CommonFormCard(
            name: name,
            activity: activity,
            address: address,
            description: description,
            email: email,
            phoneNum: phoneNum,
            progress: progress,
            isRepresent: false),
      );
    }
    print(pocaNum);
    // = [
    //   CommonFormCard(
    //     name: name,
    //     activity: activity,
    //     address: address,
    //     description: description,
    //     email: email,
    //     phoneNum: phoneNum,
    //     progress: progress,
    //     isRepresent: !isRepre!,
    //   ),
    //   CommonFormCard(
    //     name: name,
    //     activity: activity,
    //     address: address,
    //     description: description,
    //     email: email,
    //     phoneNum: phoneNum,
    //     progress: progress,
    //     isRepresent: false,
    //   ),
    // ];
    return Column(
      children: [
        Portfolio(images: images!, content: content!, result: result!),
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
                  () {},
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
