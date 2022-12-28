import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/poca_info.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonenum = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _activity = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _result = TextEditingController();
  TextEditingController _progressStartText = TextEditingController();
  TextEditingController _progressEndText = TextEditingController();

  String? _progress;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phonenum.dispose();
    _address.dispose();
    _activity.dispose();
    _description.dispose();
    _result.dispose();
    _progressStartText.dispose();
    _progressEndText.dispose();
    super.dispose();
  }

  bool progressing = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: 100,
                      ),
                      // 나만의 명함 만들기
                      Text("Create \nMy \nYouthPoca !",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF06A66C),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          // 이름 입력
                          Text(
                            "이름",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "이름을 입력하세요",
                            ),
                            controller: _name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "올바른 이름을 입력하세요";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // 이메일 입력
                          Text(
                            "이메일",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "이메일을 입력하세요",
                            ),
                            controller: _email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "올바른 이메일을 입력하세요";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // 전화번호 입력
                          Text(
                            "전화번호",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "전화번호를 입력하세요",
                            ),
                            controller: _phonenum,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // 주소 입력
                          Text(
                            "주소",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "주소를 입력하세요",
                            ),
                            controller: _address,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // 활동명과 역할 입력
                          Text(
                            "활동명과 역할",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "활동명과 역할을 입력하세요",
                            ),
                            controller: _activity,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // 한 줄 소개 입력
                          Text(
                            "한 줄 소개",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "한 줄 소개를 입력하세요",
                            ),
                            controller: _description,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // 진행 상황
                          Text(
                            "진행 상황",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              RadioListTile(
                                  title: Text('진행 중'),
                                  value: "진행 중",
                                  groupValue: _progress,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null) {
                                        _progress = value as String?;
                                        progressing = true;
                                      }
                                    });
                                  }),
                              RadioListTile(
                                  title: Text('진행 완료'),
                                  value: "진행 완료",
                                  groupValue: _progress,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null) {
                                        _progress = value as String?;
                                        progressing = false;
                                      }
                                    });
                                  }),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Visibility(
                                  visible: progressing ? false : true,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText:
                                              "시작 날짜를 적어주세요 (ex. 220101)",
                                        ),
                                        controller: _progressStartText,
                                      ),
                                      SizedBox(width: 10),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText:
                                              "완료 날짜를 적어주세요 (ex. 221231)",
                                        ),
                                        controller: _progressEndText,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // 대표 명함 여부 -> 처음 생성할 때는 다 false로 서버에 전달
                          // Text(
                          //   "대표 여부",
                          //   style: TextStyle(
                          //       fontSize: 15,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.w700),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),

                          // 이미지들

                          // 이미지 별 내용들

                          // 활동 결과 입력
                          Text(
                            "활동 결과",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "활동 결과를 입력하세요",
                            ),
                            controller: _result,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    ])))),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              List<String> _progressTime = [
                _progressStartText.text,
                _progressEndText.text
              ];
              String? pro;
              if (progressing == true) {
                pro = _progress;
              } else if (progressing == false) {
                pro = _progressTime.toString();
              }
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
              // 아직 이미지랑 각 이미지 내용은 추가 안해뒀음
              PocaInfo pocaData = PocaInfo(
                pocaID: "",
                ownerID: "1",
                name: _name.text,
                email: _email.text,
                phoneNum: _phonenum.text,
                address: _address.text,
                activity: _activity.text,
                description: _description.text,
                progress: pro,
                images: [],
                content: [],
                result: _result.text,
                sendTime:
                    DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
              );
              print(pocaData.progress);
              // DB에 pocaData 데이터 넘기기

              // dispose 하기
            },
            child: const Icon(Icons.create_rounded)),
      ),
    );
  }
}
