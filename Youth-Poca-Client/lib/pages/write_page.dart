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

  File? _image; // ?????? ?????? ????????????
  List<XFile> _images = []; // ?????? ?????? ??? ????????????
  bool _visibility = false; // ????????? ?????? ?????????
  final picker = ImagePicker();

  // ????????? ????????? ?????? ???????????? ??????????????? ???????????? ????????????.
  // ?????? ????????? ???????????? pickImage() ?????? pickMultiImage()
  Future getImage(ImageSource imageSource) async {
    // final image = await picker.pickImage(source: imageSource);
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null) {
      setState(() {
        _images = images; // ????????? ???????????? _image??? ??????
        print(_images);
        //_images = images.map<File>((xfile) => File(xfile.path)).toList();
      });
    }
  }

  // ????????? ?????? visible ?????? ??????
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
                          // ????????? ?????? ?????????
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
                              // ?????? ??????
                              Text(
                                "??????",
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
                                  labelText: "????????? ???????????????",
                                ),
                                controller: _name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "????????? ????????? ???????????????";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // ????????? ??????
                              Text(
                                "?????????",
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
                                  labelText: "???????????? ???????????????",
                                ),
                                controller: _email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "????????? ???????????? ???????????????";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // ???????????? ??????
                              Text(
                                "????????????",
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
                                  labelText: "??????????????? ???????????????",
                                ),
                                controller: _phonenum,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // ?????? ??????
                              Text(
                                "??????",
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
                                  labelText: "????????? ???????????????",
                                ),
                                controller: _address,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // ???????????? ?????? ??????
                              Text(
                                "???????????? ??????",
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
                                  labelText: "???????????? ????????? ???????????????",
                                ),
                                controller: _activity,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // ??? ??? ?????? ??????
                              Text(
                                "??? ??? ??????",
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
                                  labelText: "??? ??? ????????? ???????????????",
                                ),
                                controller: _description,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // ?????? ??????
                              Text(
                                "?????? ??????",
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
                                      title: Text('?????? ???'),
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
                                      title: Text('?????? ??????'),
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
                                                  "?????? ????????? ??????????????? (ex. 220101)",
                                            ),
                                            controller: _progressStartText,
                                          ),
                                          SizedBox(width: 10),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText:
                                                  "?????? ????????? ??????????????? (ex. 221231)",
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
                              // ?????? ?????? ?????? -> ?????? ????????? ?????? ??? false??? ????????? ??????
                              // Text(
                              //   "?????? ??????",
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.w700),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),

                              // ????????????
                              Text(
                                "??????",
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
                              // ??????
                              Text(
                                "?????? ??????",
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
                                  labelText: "?????? ????????? ???????????????",
                                ),
                                controller: _content,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // ?????? ?????? ??????
                              Text(
                                "?????? ??????",
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
                                  labelText: "?????? ????????? ???????????????",
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
                  // ?????? ???????????? ??? ????????? ????????? ?????? ????????????
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
                  // DB??? pocaData ????????? ?????????
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

                  // dispose ??????
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
