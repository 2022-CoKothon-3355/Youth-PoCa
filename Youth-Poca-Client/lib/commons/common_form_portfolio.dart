import 'package:flutter/material.dart';

class CommonFormPortfolio extends StatefulWidget {
  final image;
  final content;

  const CommonFormPortfolio({this.image, this.content});

  @override
  State<CommonFormPortfolio> createState() =>
      _CommonFormPortfolioState(image, content);
}

class _CommonFormPortfolioState extends State<CommonFormPortfolio> {
  final image;
  final content;
  _CommonFormPortfolioState(this.image, this.content);
  @override
  Widget build(BuildContext context) {
    final Mwidth = MediaQuery.of(context).size.width;
    final Mheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: Mwidth,
            height: Mwidth * 0.995,
            color: Colors.black,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              border: Border.all(color: Colors.black),
            ),
            width: Mwidth,
            height: Mheight * 0.2,
            child: Center(
              child: Text(
                content.isEmpty ? "활동 내용" : content[0],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
