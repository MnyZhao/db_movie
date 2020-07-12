import 'package:dbmovie/local/my_locations.dart';
import 'package:dbmovie/net/api/api.dart';
import '../main.dart';
import 'file:///D:/Flutter/flutter_project/db_movie/db_movie/lib/net/api/resposity/user_resposity.dart';
import 'package:dbmovie/net/dio/dio_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var _userController = TextEditingController();
  var _pwdController = TextEditingController();
  IconData _lockIcon = Icons.lock_outline;
  var _isPwd = true;

// 焦点
  FocusNode focusNodeUser = FocusNode();
  FocusNode focusNodePwd = FocusNode();

  @override
  Widget build(BuildContext context) {
    var language = MyLocation.of(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10, left: 20.0, right: 20.0),
        margin: EdgeInsets.only(top: 100.0, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            /// 让column自适应大小
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5.0, bottom: 0.0),
                    helperText: "${language.trans("input_name")}",
                    prefixIcon: Icon(Icons.account_box),
                    prefixIconConstraints:
                        BoxConstraints(minHeight: 40, minWidth: 40),
                    labelText: "${language.trans("name")}"),
              ),
              spacingContainer(height: 10.0),
              TextField(
                // 设置为密码
                obscureText: _isPwd,
                controller: _pwdController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5.0, bottom: 0.0),
                  labelText: "${language.trans("pwd")}",
                  helperText: "${language.trans("input_pwd")}",
                  prefixIcon: Icon(Icons.lock),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 40, minHeight: 40),
                  suffixIcon: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(_lockIcon),
                      onPressed: () {
                        setState(() {
                          _isPwd = !_isPwd;
                          _lockIcon =
                              _isPwd ? Icons.lock_outline : Icons.lock_open;
                        });
                      }),
                  suffixIconConstraints:
                      BoxConstraints(maxWidth: 40, maxHeight: 40),
                ),
              ),
              spacingContainer(height: 10.0),
              Row(
                children: [
                  spacingContainer(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context){
                            return Register();
                          }
                        ));
                      },
                      textColor: Colors.white,
                      child: Text(language.trans("register")),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () async {
//                        var user = login(
//                            context, _userController.text, _pwdController.text);
                        var user = await lo(
                            context, _userController.text, _pwdController.text);
                        if (null != user) {
                          print("登陆成功 user");
                        }
                      },
                      textColor: Colors.white,
                      child: Text(language.trans("login")),
                    ),
                  ),
                  spacingContainer(width: 10.0, color: Colors.redAccent),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

main() => runApp(MaterialApp(
        home: Scaffold(
      body: Login(),
    )));

Widget getInput(
    {TextEditingController controller,
    String labelText,
    String helperText,
    IconData prefixIcon,
    IconButton}) {}
