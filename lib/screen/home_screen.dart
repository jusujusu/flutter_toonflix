/* 
메인 화면

FutureBuilder를 사용해 statefulwidget이 아닌 statelesswidget에서
api 데이터를 받아와 사용 가능
 */

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons =
      ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        // future: 이 FutureBuilder가 기다릴 Future를 지정합니다.
        // webtoons 변수에는 ApiService.getTodaysToons()의 결과(Future<List<WebtoonModel>>)가 담겨 있습니다.
        future: webtoons,
        // builder: future의 상태가 변경될 때마다 UI를 다시 그리는 함수입니다.
        // snapshot을 통해 future의 현재 상태(로딩 중, 데이터 있음, 에러 발생 등)를 알 수 있습니다.
        builder: (context, snapshot) {
          // snapshot에 데이터가 있는지 확인합니다. 데이터가 있으면 Future가 성공적으로 완료된 것입니다.
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(height: 50),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // 웹툰 목록 디자인 위젯
  ListView makeList(
    AsyncSnapshot<List<WebtoonModel>> snapshot,
  ) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(width: 20),
    );
  }
}
