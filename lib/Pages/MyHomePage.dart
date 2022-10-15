import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:musicapplication/Values/AppStyle.dart';
import 'package:musicapplication/Values/Icon.dart';

import '../CallAPI/CallAPI.dart';
import '../Models/QuangCao.dart';
import '../Models/BaiHat.dart';
import '../Models/TheLoai.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<QuangCao> listQuangCao = [];
  List<BaiHat> listBaiHat = [];
  List<TheLoai> listTheLoai = [];
  int select = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(viewportFraction: 1);
    super.initState();
    CallAPI.getQuangCao(listQuangCao);
    CallAPI.getBaiHat(listBaiHat);
    CallAPI.getTheLoai(listTheLoai);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff242A37),
      appBar: AppBar(
        backgroundColor: const Color(0xff242A37),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: size.height / 5,
            width: size.width / 0.9,
            margin: EdgeInsets.all(10),
            child: PageView.builder(
                controller: _pageController,
                itemCount: listQuangCao.length,
                onPageChanged: (value) {
                  setState(() {
                    select = value;
                  });
                },
                itemBuilder: ((context, index) {
                  return Stack(
                    children: [
                      Container(
                          width: size.width / 0.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              '${listQuangCao[index].linkHinh}',
                              fit: BoxFit.fill,
                            ),
                          )),
                      Container(
                          width: size.width / 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black26)),
                      Positioned(
                          left: 0,
                          bottom: 0,
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(10),
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                    '${listQuangCao[index].linkHinh}',
                                    fit: BoxFit.fill,
                                  )),
                              Text('${listQuangCao[index].noiDungQuangCao}',
                                  style: AppStyle.h5)
                            ],
                          )),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                            height: 8,
                            width: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildSelect(0),
                                buildSelect(1),
                                buildSelect(2),
                                buildSelect(3),
                                buildSelect(4),
                              ],
                            )),
                      )
                    ],
                  );
                })),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     buildIcon(AppIcon.musicIcon, 'Nhac mới'),
          //     buildIcon(AppIcon.genresIcon, 'Thể Loai'),
          //     buildIcon(AppIcon.playlistIcon, 'Playlist'),
          //   ],
          // ),
          Container(
            height: size.height / 20,
            padding: EdgeInsets.only(left: 10, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thể Loai',
                  style: AppStyle.h5,
                ),
                InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Xem thêm...',
                        style: AppStyle.h5.copyWith(color: Colors.purpleAccent),
                      ),
                    )),
              ],
            ),
          ),
          Container(
            height: size.height / 6,
            width: size.width / 0.9,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listBaiHat.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width / 3.5,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            '${listBaiHat[index].linkHinh}',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: AutoSizeText(
                            textAlign: TextAlign.center,
                            minFontSize: 10,
                            maxLines: 3,
                            '${listBaiHat[index].tenBaiHat}',
                            style: AppStyle.h6.copyWith(letterSpacing: 3),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            height: size.height / 20,
            padding: EdgeInsets.only(left: 10, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thể Loai',
                  style: AppStyle.h4,
                ),
                InkWell(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Xem thêm...',
                    style: AppStyle.h5.copyWith(color: Colors.purpleAccent),
                  ),
                )),
              ],
            ),
          ),
          Container(
            height: size.height / 6,
            width: size.width / 0.9,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listTheLoai.length,
                itemBuilder: (context, index) {
                  return buildGenres('${listTheLoai[index].linkHinh}',
                      '${listTheLoai[index].tenTheLoai}', size);
                }),
          )
        ],
      ),
    );
  }

  Widget buildSelect(int active) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: active == select ? Colors.white : Colors.white10),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: isActive ? size.width * 1 / 50 : 4,
      decoration: BoxDecoration(
          color: isActive ? Colors.greenAccent : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }

  Widget buildIcon(String linkIcon, String text) {
    return InkWell(
      child: SizedBox(
        height: 70,
        width: 50,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                '$linkIcon',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 20,
              width: 50,
              child: Center(
                child: AutoSizeText(
                  '$text',
                  maxLines: 1,
                  minFontSize: 10,
                  style: AppStyle.h6,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGenres(String linkGenres, String text, Size size) {
    return InkWell(
      child: Container(
        width: size.width * 0.6,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('$linkGenres'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Positioned(
                left: 10,
                bottom: 10,
                child: Text(
                  '${text}',
                  style: AppStyle.h5.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
