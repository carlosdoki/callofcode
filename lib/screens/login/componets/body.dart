import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpcare/constants.dart';
import 'package:helpcare/screens/home/home2_screen.dart';
import 'package:helpcare/screens/home/home_screen.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 3.0,
                      child: Image.asset("assets/images/helpcare.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LoginText(
                      keyboard: TextInputType.emailAddress,
                      icon: Icons.email,
                      hint: "Digite seu email",
                    ),
                    SizedBox(height: 10.0),
                    LoginText(
                      keyboard: TextInputType.text,
                      icon: Icons.lock,
                      hint: "Digite sua senha",
                      password: true,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () =>
                            print('Botao esquecer senha pressionado'),
                        padding: EdgeInsets.only(right: 0.0),
                        child: Text('Esqueceu a senha',
                            style: TextStyle(color: kTextColor)),
                      ),
                    ),
                    Container(
                      height: 20.0,
                      child: Row(
                        children: <Widget>[
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: _rememberMe,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Lembrar',
                            style: TextStyle(
                              color: kTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home2Screen()),
                          );
                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.white,
                        child: Text(
                          'ENTRAR',
                          style: TextStyle(
                            color: kTextColor,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType keyboard;
  final bool password;

  const LoginText({
    Key key,
    this.icon,
    this.hint,
    this.keyboard,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60.0,
      child: TextField(
        obscureText: password,
        keyboardType: keyboard,
        style: TextStyle(
          color: kTextColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: kTextLightColor,
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
