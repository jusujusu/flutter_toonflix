/* 
메인 화면
 */

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = []; // 웹툰 목록을 넣을 배열
  bool isLoading = true;

  // 웹툰 목록 호출 비동기 메서드
  void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // 웹툰 목록 호출
    waitForWebToons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);

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
    );
  }
}
