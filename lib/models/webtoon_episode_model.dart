/* 
웹툰 에피소드 목록
 */

class WebtoonEpisodeModel {
  // 필드
  final String id, title, rating, date;

  // 네임드 생성자
  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      rating = json['rating'],
      date = json['date'];
}
