class PocaInfo {
  // 명함에 들어가는 정보 클래스

  final String? pocaID; // Poca의 ID
  final String ownerID; // 사용자 ID
  final String name; // 이름
  final String email; // 이메일
  String? phoneNum; // 전화번호
  String? address; // 학교나 회사 주소
  String? activity; // 활동명과 역할
  String? description; // 한 줄 소개
  final progress; // 진행 상황
  bool? isRepresent; // 대표 명함인지(true/false)
  List<String>? images; // 포트폴리오의 이미지들
  List<String>? content; // 포트폴리오의 내용들
  String? result; // 포트폴리오의 결과
  String? sendTime; // 명함 생성 시간

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
      this.content,
      this.result,
      this.sendTime});
}