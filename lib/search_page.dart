import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instar_clone/create_page.dart';
import 'package:instar_clone/detail_post_page.dart';

class SearchPage extends StatefulWidget {
  final FirebaseUser user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buidBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context){
                return CreatePage(widget.user);
              })
          );
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _buidBody() {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('post').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }

          var items = snapshot.data?.documents ?? [];

          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,//열의개수
                  childAspectRatio: 1.0,//이미지 가로세로 비율
                  mainAxisSpacing: 1.0,//미세공간
                  crossAxisSpacing: 1.0
              ),
              itemCount: items.length,
              itemBuilder: (context, index){
                return _buildListItem(context, items[index]);
              });
        },
      ),
    );
  }

  Widget _buildListItem(context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailPostPage(document);
            }));
          },
          child: Image.network(
          document['photoUrl'],
          fit: BoxFit.cover),
        ),
      ),
    );
  }
}
