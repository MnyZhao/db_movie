import 'package:dbmovie/local/my_locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _userCtrl = TextEditingController();
  TextEditingController _pwdCtrl = TextEditingController();
  TextEditingController _pwdConfirmCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var language = MyLocation.of(context);
    return Scaffold(
      appBar: getAppBar("${language.trans("register")}"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller: _userCtrl,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5.0, bottom: 0.0),
                  helperText: "${language.trans("input_name")}",
                  prefixIcon: Icon(Icons.account_box),
                  prefixIconConstraints:
                      BoxConstraints(minHeight: 40, minWidth: 40),
                  labelText: "${language.trans("name")}"),
            ),
            spacingContainer(height: 10.0),
            getPwdWidget(_pwdCtrl,language.trans("input_pwd"),language.trans("pwd")),
            spacingContainer(height: 10.0),
            getPwdWidget(_pwdConfirmCtrl,language.trans("input_pwd_confirm"),language.trans("pwd")),
            spacingContainer(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Register();
                }));
              },
              textColor: Colors.white,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    language.trans("register"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
void register(String userName,String pwd){

}
Widget getPwdWidget(
    TextEditingController controller, String helpText, String labelText) {
  return TextField(
    controller: controller,
    obscureText: true,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5.0, bottom: 0.0),
        helperText: "$helpText",
        prefixIcon: Icon(Icons.lock),
        prefixIconConstraints: BoxConstraints(minHeight: 40, minWidth: 40),
        labelText: "$labelText"),
  );
}
