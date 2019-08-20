import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow/blocs/authentication/authentication_bloc.dart';
import 'package:login_flow/blocs/reset_password/resetpwd_bloc.dart';
import 'package:login_flow/services/repositories/repositories.dart';
import 'package:login_flow/widgets/forgot_pwd_form.dart';

class ResetPage extends StatelessWidget {

  final UserRepository userRepository;

  ResetPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO:
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Container(
                width: 148.0,
                height: 142.71,
                child: Image.asset('images/success.png')),
            content: Container(
              height: 140.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Success",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32.0,
                        color: Color.fromRGBO(62, 211, 132, 1)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: new Text(
                      "Link sent. Please check your email inbox.",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Color.fromRGBO(126, 126, 126, 1)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    color: Color.fromRGBO(62, 211, 132, 1),
                    width: 200.0,
                    height: 48,
                    child: RaisedButton(
                      onPressed: null,
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 155, bottom: 40.41),
                child: Text(
                  "Reset Password",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Color.fromRGBO(63, 54, 80, 1),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
//              Container(
//                  width: 87.48, height: 72.23, child: Image.asset('images/1.png')),
              Container(
                margin: const EdgeInsets.only(
                    top: 26.25, bottom: 76.0, right: 68, left: 68),
                child: Text(
                  "We will send a new password to the email address you provide below only if it is connected to a account.",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Color.fromRGBO(129, 121, 144, 1),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              BlocProvider<ResetPasswordBloc>(
                builder: (context) {
                  return ResetPasswordBloc(
                      authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
                      userRepository: userRepository
                  );
                },
                child: ForgotPasswordForm(),
              )
            ],
          )),
    );
  }
}
