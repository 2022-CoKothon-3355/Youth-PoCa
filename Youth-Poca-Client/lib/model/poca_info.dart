List<PocaInfo> pocasFromJson(dynamic str) =>
    List<PocaInfo>.from((str).map((x) => PocaInfo.fromJson(x)));

class PocaInfo {
  // 명함에 들어가는 정보 클래스

  late dynamic pocaID; // Poca의 ID
  late dynamic ownerID; // 사용자 ID
  late dynamic name; // 이름
  late dynamic email; // 이메일
  late dynamic? phoneNum; // 전화번호
  late dynamic? address; // 학교나 회사 주소
  late dynamic? activity; // 활동명과 역할
  late dynamic? description; // 한 줄 소개
  late var progress; // 진행 상황
  late bool? isRepresent; // 대표 명함인지(true/false)
  late List<dynamic>? images; // 포트폴리오의 이미지들
  late List<dynamic>? contents; // 포트폴리오의 내용들
  late dynamic? result; // 포트폴리오의 결과
  late dynamic? sendTime; // 명함 생성 시간

  PocaInfo(
      {required this.pocaID,
      required this.ownerID,
      required this.name,
      required this.email,
      this.phoneNum,
      this.address,
      this.activity,
      this.description,
      this.progress,
      this.isRepresent,
      this.images,
      this.contents,
      this.result,
      this.sendTime});

  PocaInfo.fromJson(Map<String, dynamic> json) {
    pocaID = json["pocaId"];
    ownerID = json["ownerId"];
    name = json["name"];
    email = json["email"];

    phoneNum = json["phoneNum"];
    address = json["address"];
    activity = json["activity"];
    description = json["description"];
    progress = json["progress"];
    // isRepresent = json["isRepresent"];
    images = json["images"];
    contents = json["content"];
    result = json["result"];
  }

  Map<String, dynamic> toJson() {
    final _pocaData = <String, dynamic>{};

    _pocaData["pocaId"] = pocaID;
    _pocaData["ownerId"] = ownerID;
    _pocaData["name"] = name;
    _pocaData["email"] = email;
    _pocaData["phoneNum"] = phoneNum;
    _pocaData["address"] = address;
    _pocaData["activity"] = activity;
    _pocaData["description"] = description;
    _pocaData["progress"] = progress;
    // _pocaData["isRepresent"] = isRepresent;
    _pocaData["images"] = images;
    _pocaData["content"] = contents;
    _pocaData["result"] = result;
    _pocaData["sendTime"] = sendTime;

    return _pocaData;
  }
}
