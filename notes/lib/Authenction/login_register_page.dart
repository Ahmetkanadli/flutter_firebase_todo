


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/Authenction/widget_tree.dart';

import '../Providers/id_provider.dart';
import '../home_page.dart';
import 'auth.dart';


class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);



  String? errorMessage = '';

  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _nameController = TextEditingController();



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final idProv = ref.watch(idProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase outh")
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  hintText: 'isim'
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'email'
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: 'password'
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Auth().signUp(name :_nameController.text,email: _emailController.text, password: _passwordController.text, ref: ref);
                },
                child: Text("kaydol")),
            ElevatedButton(
                onPressed: (){
                  Auth().singIn(email: _emailController.text, password: _passwordController.text,ref: ref);
                  print("giriş yapıldı");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Text("girisYap"))
          ],
        ),
      )
    );
  }
}


/*
class loginPage extends ConsumerStatefulWidget{
  const loginPage({Key ? key}) : super(key:key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_loginPageState();
}

class _loginPageState extends ConsumerState<loginPage>{

  String? errorMessage = '';

  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context){
    final idProv = ref.watch(idProvider);
    return Scaffold(
        appBar: AppBar(
            title: Text("firebase outh")
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: 'isim'
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'email'
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: 'password'
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    Auth().signUp(name :_nameController.text,email: _emailController.text, password: _passwordController.text, ref: ref);
                  },
                  child: Text("kaydol")),
              ElevatedButton(
                  onPressed: () async {
                   try{
                     await Auth().singIn(email: _emailController.text, password: _passwordController.text, ref: ref);
                     print("giriş yapıldı");
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homePage()));

                   }catch(e){
                     print("error : ${e.toString()}");
                   }
                  },
                  child: Text("girisYap")
              )

            ],
          ),
        )
    );
  }
}

*/
