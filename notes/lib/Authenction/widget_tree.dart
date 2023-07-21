
import 'package:flutter/material.dart';

import '../home_page.dart';
import 'auth.dart';
import 'login_register_page.dart';

class widgetTree extends StatefulWidget {
  const widgetTree({super.key});

  @override
  State<widgetTree> createState() => _widgetTreeState();
}

class _widgetTreeState extends State<widgetTree> {



  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        //stream: Auth().authstatechanges,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return HomePage();
          }
          else{
            return  LoginPage();
          }
        }
    );
  }
}
