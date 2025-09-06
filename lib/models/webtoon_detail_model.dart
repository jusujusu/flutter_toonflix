/* 
웹툰 상세 정보에 사용되는 모델
 */

class WebtoonDetailModel {
  // 사용 필드
  final String title, about, genre, age;

  // 네임드 생성자
  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
    : title = json['tile'],
      about = json['about'],
      genre = json['genre'],
      age = json['age'];
}
