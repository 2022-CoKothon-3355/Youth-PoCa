List<PocaInfo> pocasFromJson(dynamic str) =>
    List<PocaInfo>.from((str).map((x) => PocaInfo.fromJson(x)));

class PocaInfo {
  // 명함에 들어가는 정보 클래스

  late String pocaID; // Poca의 ID
  late String ownerID; // 사용자 ID
  late String name; // 이름
  late String email; // 이메일
  late String? phoneNum; // 전화번호
  late String? address; // 학교나 회사 주소
  late String? activity; // 활동명과 역할
  late String? description; // 한 줄 소개
  late var progress; // 진행 상황
  late bool? isRepresent; // 대표 명함인지(true/false)
  late List<String>? images; // 포트폴리오의 이미지들
  late List<String>? contents; // 포트폴리오의 내용들
  late String? result; // 포트폴리오의 결과
  late String? sendTime; // 명함 생성 시간

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
    pocaID = json["pocaID"];
    ownerID = json["ownerId"];
    name = json["name"];
    email = json["email"];

    phoneNum = json["phoneNum"];
    address = json["address"];
    activity = json["activity"];
    description = json["description"];
    progress = json["progress"];
    isRepresent = json["isRepresent"];
    images = json["images"];
    contents = json["contents"];
    result = json["result"];
    sendTime = json["sendTime"];
  }

  Map<String, dynamic> toJson() {
    final _pocaData = <String, dynamic>{};

    _pocaData["pocaID"] = pocaID;
    _pocaData["ownerID"] = ownerID;
    _pocaData["name"] = name;
    _pocaData["email"] = email;
    _pocaData["phoneNum"] = phoneNum;
    _pocaData["address"] = address;
    _pocaData["activity"] = activity;
    _pocaData["description"] = description;
    _pocaData["progress"] = progress;
    _pocaData["isRepresent"] = isRepresent;
    _pocaData["images"] = images;
    _pocaData["contents"] = contents;
    _pocaData["result"] = result;
    _pocaData["sendTime"] = sendTime;

    return _pocaData;
  }
}
