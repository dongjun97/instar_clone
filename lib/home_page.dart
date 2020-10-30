import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//상단바
        title: Text(
          'Insta Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),//바디 불러오기
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.all(8.0), //8정도 패딩
        child: SafeArea(//핸드폰에 출력되는 정도
            child: SingleChildScrollView(//스크롤
              child: Center(//중앙에 위치
                  child: Column(//행
                    children: <Widget>[//리스트들
                      Text('Insta에 오신것을 환영합니다',
                        style: TextStyle(fontSize: 24.0),//폰트 사이즈
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),//패딩
                      Text('사진과 동영상을 보려면 팔로우 하세요'),
                      Padding(padding: EdgeInsets.all(16.0)),//패딩
                      SizedBox(//사이즈 정해주기
                        width: 260.0,
                        child: Card(//카드형식의 디자인
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(8.0)),
                                SizedBox(//이미지 사이즈
                                  width: 80.0,
                                  height: 80.0,
                                  child: CircleAvatar(//둥근 이미지
                                    backgroundImage: NetworkImage(user.photoUrl),//이미지 url
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8.0)),//패딩
                                Text(user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(user.displayName),
                                Padding(padding: EdgeInsets.all(8.0)),//패딩
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(1.0)),
                                    SizedBox(
                                      width:  70.0,
                                      height: 70.0,
                                      child: Image.network('https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20100113_10%2Fdbwjd177_12633924830421M1mY_jpg%2Fc6f7b8de2_yousongyee_dbwjd177.jpg&type=sc960_832'
                                          ,fit: BoxFit.cover),
                                    ),
                                    Padding(padding: EdgeInsets.all(1.0)),
                                    SizedBox(
                                      width:  70.0,
                                      height: 70.0,
                                      child: Image.network('https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20120127_196%2Fehddbs8097_1327661473238fGffJ_jpg%2F%25C8%25AE%25B4%25EB3_1_ehddbs8097.jpg&type=sc960_832'
                                          ,fit: BoxFit.cover),
                                    ),
                                    Padding(padding: EdgeInsets.all(1.0)),
                                    SizedBox(
                                      width:  70.0,
                                      height: 70.0,
                                      child: Image.network('https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2Fdata21%2F2008%2F3%2F29%2F7%2F%25BE%25C6%25C1%25F62_kjh04069.gif&type=sc960_832_gif'
                                          ,fit: BoxFit.cover),
                                    ),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(4.0)),
                                Text('FaceBook 친구'),
                                Padding(padding: EdgeInsets.all(4.0)),
                                RaisedButton(//버튼
                                    child: Text('팔로우'),
                                    color: Colors.blueAccent,//버튼크기
                                    textColor: Colors.white,//버튼 글자 색
                                    onPressed: () {}),
                                Padding(padding: EdgeInsets.all(4.0)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              ),
            )
        )
    );
  }
}
