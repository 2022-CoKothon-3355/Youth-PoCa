import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:intl/intl.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:snippet_coder_utils/ProgressHUD.dart';
// import 'package:snippet_coder_utils/hex_color.dart';
import '../model/poca_info.dart';
import '../services/api_service.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  PocaInfo? pocaInfo;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  // List<Object> _images = [];
  bool isEditMode = false;
  bool isImageSelected = false;
  late bool progressing;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonenum = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _activity = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _result = TextEditingController();
  TextEditingController _progressStartText = TextEditingController();
  TextEditingController _progressEndText = TextEditingController();
  TextEditingController _content = TextEditingController();

  String? _progress;

  @override
  void initState() {
    super.initState();
    pocaInfo = PocaInfo(pocaID: " ", ownerID: "1", name: " ", email: " ");
    progressing = true;

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        pocaInfo = arguments['model'];
        isEditMode = false;
        setState(() {});
      }
    });
  }

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

  File? _image; // 사진 하나 가져오기
  List<XFile> _images = []; // 사진 여러 개 가져오기
  bool _visibility = false; // 가져온 사진 보이기
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  // 여러 이미지 가져오기 pickImage() 말고 pickMultiImage()
  Future getImage(ImageSource imageSource) async {
    // final image = await picker.pickImage(source: imageSource);
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null) {
      setState(() {
        _images = images; // 가져온 이미지를 _image에 저장
        print(_images);
        //_images = images.map<File>((xfile) => File(xfile.path)).toList();
      });
    }
  }

  // 가져온 사진 visible 상태 변경
  void _hide() {
    setState(() {
      _visibility = false;
    });
  }

  void _show() {
    setState(() {
      _visibility = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: globalFormKey,
        child: GestureDetector(
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
                                      value: "true",
                                      groupValue: _progress,
                                      onChanged: (value) {
                                        setState(() {
                                          if (value != null) {
                                            _progress =
                                                value.toString() as String?;
                                            progressing = true;
                                          }
                                        });
                                      }),
                                  RadioListTile(
                                      title: Text('진행 완료'),
                                      value: "false",
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
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
                              Text(
                                "사진",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    getImage(ImageSource.gallery);
                                    _show();
                                  },
                                  icon: Icon(Icons.attach_file)),
                              SizedBox(
                                height: 30,
                              ),
                              // 내용
                              Text(
                                "활동 내용",
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
                                  labelText: "활동 내용를 입력하세요",
                                ),
                                controller: _content,
                              ),
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
                  // 아직 이미지랑 각 이미지 내용은 추가 안해뒀음
                  pocaInfo = PocaInfo(
                    pocaID: " ",
                    ownerID: "1",
                    name: _name.text,
                    email: _email.text,
                    phoneNum: _phonenum.text,
                    address: _address.text,
                    activity: _activity.text,
                    description: _description.text,
                    progress: pro,
                    images: _images,
                    contents: [_content.text],
                    result: _result.text,
                    sendTime: DateFormat("yyyy-MM-dd hh:mm:ss")
                        .format(DateTime.now()),
                  );
                  print(pocaInfo!.progress);
                  // DB에 pocaData 데이터 넘기기
                  if (validateAndSave()) {
                    print(pocaInfo!.toJson());

                    setState(() {
                      isApiCallProcess = true;
                    });

                    APIService.savePoca(
                      pocaInfo!,
                      isEditMode,
                      isImageSelected,
                    ).then((response) {
                      setState(() {
                        isApiCallProcess = false;
                      });
                    });
                  }
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);

                  // dispose 하기
                },
                child: const Icon(Icons.create_rounded)),
          ),
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
