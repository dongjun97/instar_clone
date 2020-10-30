import 'package:flutter/material.dart';
import 'package:instar_clone/login_page.dart';
import 'package:instar_clone/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return TabPage(snapshot.data);
        } else{
          return LoginPage();
        }
      },
    );
  }
}
