import 'package:flutter/material.dart';
import 'package:youth_poca/commons/common_form_card.dart';

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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            CommonFormCard(
                name: name,
                activity: activity,
                address: address,
                description: description,
                email: email,
                phoneNum: phoneNum,
                progress: progress),
          ],
        ),
      ),
    );
  }
}
