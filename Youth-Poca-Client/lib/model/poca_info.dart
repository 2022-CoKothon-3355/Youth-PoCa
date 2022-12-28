class PocaInfo {
  // 명함에 들어가는 정보 클래스

  final String? pocaID; // Poca의 ID
  final String name; // 이름
  final String email; // 이메일
  String? phoneNum; // 전화번호
  String? address; // 학교나 회사 주소
  String? actiity; // 활동명과 역할
  String? description; // 한 줄 소개
  String? progrss; // 진행 상황
  bool? isRepresent; // 대표 명함인지(true/false)
  List<String>? images; // 포트폴리오의 이미지들
  List<String>? content; // 포트폴리오의 내용들
  String? result; // 포트폴리오의 결과

  PocaInfo(
      {required this.pocaID,
      required this.name,
      required this.email,
      this.phoneNum,
      this.address,
      this.actiity,
      this.description,
      this.progrss,
      this.isRepresent,
      this.images,
      this.content,
      this.result});
}
