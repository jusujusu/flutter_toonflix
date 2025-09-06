/* 
웹툰 목록에 사용되는 모델 파일
 */
class WebtoonModel {
  // 웹툰의 제목, 썸네일 이미지 URL, ID를 저장하는 final 필드입니다.
  // final로 선언되었기 때문에 한 번 값이 할당되면 변경할 수 없습니다.
  final String title, thumb, id;

  // fromJson 네임드 생성자:
  // JSON(Map<String, dynamic> 형태) 데이터를 받아 WebtoonModel 객체를 생성합니다.
  // 콜론(:) 뒤의 초기화 리스트를 사용하여 final 필드를 초기화합니다.
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'], // json 맵에서 'title' 키의 값을 title 필드에 할당
        thumb = json['thumb'], // json 맵에서 'thumb' 키의 값을 thumb 필드에 할당
        id = json['id'];       // json 맵에서 'id' 키의 값을 id 필드에 할당
}
