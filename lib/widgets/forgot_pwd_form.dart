import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow/blocs/login/login.dart';
class ForgotPasswordForm extends StatefulWidget {
  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String email;
  String password;


  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      loginBloc.dispatch(LoginButtonPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 32, bottom: 32, left: 33, right: 34),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        "Your Email",
                        style: new TextStyle(
                            color: Color.fromRGBO(129, 121, 144, 1),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 9),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: new InputDecoration(
                            hintText: 'sylviaamuda@gmail.com',
                            hintStyle: new TextStyle(
                                color: Color.fromRGBO(63, 54, 80, 1),
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal),
                          ),
                          validator: _validateEmail,
                          controller: _emailController,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 32, bottom: 32, left: 33, right: 34),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        "Your Password",
                        style: new TextStyle(
                            color: Color.fromRGBO(129, 121, 144, 1),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 9),
                        child: TextFormField(
                          decoration: new InputDecoration(
                            hintText: '***********',
                            hintStyle: new TextStyle(
                                color: Color.fromRGBO(63, 54, 80, 1),
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal),
                          ),
                          controller: _passwordController,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity, minHeight: 46),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: RaisedButton(
                        child: new Text(
                          'Log in',
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed:
                        state is! LoginLoading ? _onLoginButtonPressed : null,
//                  onPressed: () {
//                    Navigator.pushNamed(context, "/firstLogin");
//                    // Navigator.pushNamed(context, '/dashboard');
//                  },
                        color: Color.fromRGBO(137, 72, 252, 1)),
                  ),
                ),
                Container(
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
  }

  String _validatePassword(String value) {
    if (value.length > 5) {
      return null;
    }

    return 'Password must be upto 6 characters';
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

