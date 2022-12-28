import 'package:flutter/material.dart';

class CommonFormCard extends StatefulWidget {
  final name;
  final email;
  final phoneNum;
  final address;
  final activity;
  final progress;
  final description;

  const CommonFormCard(
      {required this.name,
      required this.email,
      required this.phoneNum,
      required this.address,
      required this.activity,
      required this.progress,
      required this.description});

  @override
  State<CommonFormCard> createState() => _CommonFormCardState(
      name, email, phoneNum, address, activity, progress, description);
}

class _CommonFormCardState extends State<CommonFormCard> {
  final name;
  final email;
  final phoneNum;
  final address;
  final activity;
  final progress;
  final description;

  _CommonFormCardState(this.name, this.email, this.phoneNum, this.address,
      this.activity, this.progress, this.description);

  @override
  Widget build(BuildContext context) {
    final Mwidth = MediaQuery.of(context).size.width;
    final Mheight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white, //Color(0xFFBFCAD6),
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      width: Mwidth * 0.85,
      height: Mheight * 0.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                Spacer(),
                Text(
                  (progress ? "진행중" : "진행완료"),
                  style: const TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: Mheight * 0.01),
            Text(
              "$name",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "$activity",
              style: TextStyle(
                  color: Color(0xFFBFCAD6),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Mheight * 0.01),
            Row(
              children: [
                Text("M. ${phoneNum}"),
                Spacer(),
                Text("E. ${email}"),
              ],
            ),
            Text("G. ${address}"),
            SizedBox(height: Mheight * 0.01),
            Text(
              "$description",
              style: TextStyle(color: Color(0xFFBFCAD6)),
            ),
          ],
        ),
      ),
    );
  }
}
