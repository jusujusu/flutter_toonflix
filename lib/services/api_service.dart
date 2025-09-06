/* 
api 클래스
 */

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  // baseUrl
  static final String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  // 오늘의 웹툰 목록
  static final String today = "today";

  // 오늘의 웹툰 목록 api 메서드
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    // 오늘의 웹툰 목록 url
    final url = Uri.parse('$baseUrl/$today');

    // http get 메소드
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // 받아온 데이터를 json 형태로 변경
      final List<dynamic> webtoons = jsonDecode(
        response.body,
      );

      // json으로 잘 나오는지 확인
      for (var webtoon in webtoons) {
        webtoonInstances.add(
          WebtoonModel.fromJson(webtoon),
        );
      }

      return webtoonInstances;
    }
    throw Error();
  }

  // 웹툰 상세 정보 api
  static Future<WebtoonDetailModel> getToonById(
    String id,
  ) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  // 웹툰 에피소드 목록 api
  static Future<List<WebtoonEpisodeModel>>
  getLatestEpisodes(String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];

    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);

      for (var episode in episodes) {
        episodesInstances.add(
          WebtoonEpisodeModel.fromJson(episode),
        );
      }
      return episodesInstances;
    }
    throw Error();
  }
}
