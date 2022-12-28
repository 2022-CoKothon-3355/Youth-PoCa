import 'package:flutter/material.dart';

import '../model/poca_info.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phonenum = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _activity = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _result = TextEditingController();

  @override
  void _dispose() {
    _name.dispose();
    _email.dispose();
    _phonenum.dispose();
    _address.dispose();
    _activity.dispose();
    _description.dispose();
    _result.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        // 진행 상황

                        // 대표 명함 여부

                        // 이미지들

                        // 이미지 별 내용들

                        SizedBox(
                          height: 30,
                        ),
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
                      ],
                    )
                  ])))),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.pop(context);
            // 아직 이미지랑 각 이미지 내용은 추가 안해뒀음
            PocaInfo pocaData = PocaInfo(
                pocaID: "",
                name: _name.text,
                email: _email.text,
                phoneNum: _phonenum.text,
                address: _address.text,
                activity: _activity.text,
                description: _description.text,
                result: _result.text);

            // DB에 pocaData 데이터 넘기기

            _dispose();
          },
          child: const Icon(Icons.create_rounded)),
    );
  }
}
