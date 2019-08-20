import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow/blocs/authentication/authentication.dart';
import 'package:login_flow/blocs/blocs.dart';
import 'package:login_flow/services/repositories/repositories.dart';
import 'package:login_flow/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Sign in",
          style: new TextStyle(
              color: Color.fromRGBO(34, 34, 34, 1),
              fontSize: 24.0,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
                margin:
                    const EdgeInsets.only(top: 146.0, bottom: 11.0, left: 33),
                child: Text(
                  "Welcome Back,",
                  style: new TextStyle(
                      color: Color.fromRGBO(63, 54, 80, 1),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 120.0, left: 33),
                child: Text(
                  "Kindly fill in your email and password to log in.",
                  style: new TextStyle(
                      color: Color.fromRGBO(129, 121, 144, 1),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                )),
            BlocProvider(
              builder: (context) {
                return LoginBloc(
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context),
                    userRepository: userRepository);
              },
              child: LoginForm(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .dispatch(ToSignUpEvent());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: Text(
                          "Sign Up",
                          style: new TextStyle(
                              color: Color.fromRGBO(129, 121, 144, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .dispatch(ToForgotPasswordEvent());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: Text(
                          "Forgot your password?",
                          style: new TextStyle(
                              color: Color.fromRGBO(129, 121, 144, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//class _LoginPageState extends State<LoginPage> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        backgroundColor: Colors.white,
//        elevation: 0.0,
//        title: Text(
//          "Sign in",
//          style: new TextStyle(
//              color: Color.fromRGBO(34, 34, 34, 1),
//              fontSize: 24.0,
//              fontWeight: FontWeight.w500),
//        ),
//      ),
//      body: Container(
//        child: ListView(
//          children: <Widget>[
//            Container(
//                margin:
//                    const EdgeInsets.only(top: 146.0, bottom: 11.0, left: 33),
//                child: Text(
//                  "Welcome Back,",
//                  style: new TextStyle(
//                      color: Color.fromRGBO(63, 54, 80, 1),
//                      fontSize: 18.0,
//                      fontWeight: FontWeight.w500),
//                )),
//            Container(
//                margin: const EdgeInsets.only(bottom: 140.0, left: 33),
//                child: Text(
//                  "Kindly fill in your email and password to log in.",
//                  style: new TextStyle(
//                      color: Color.fromRGBO(129, 121, 144, 1),
//                      fontSize: 14.0,
//                      fontWeight: FontWeight.normal),
//                )),
//            LoginForm(
//              authenticationBloc: _authenticationBloc,
//              loginBloc: _loginBloc,
//            ),
////            Container(
////              margin: EdgeInsets.only(left: 33, right: 34),
////              child: Stack(
////                children: <Widget>[
////                  Text(
////                    "Your Email",
////                    style: new TextStyle(
////                        color: Color.fromRGBO(129, 121, 144, 1),
////                        fontSize: 14.0,
////                        fontWeight: FontWeight.normal),
////                  ),
////                  Container(
////                    margin: EdgeInsets.only(top: 9),
////                    child: TextField(
////                      keyboardType: TextInputType.emailAddress,
////                      decoration: new InputDecoration(
////                        hintText: 'sylviaamuda@gmail.com',
////                        hintStyle: new TextStyle(
////                            color: Color.fromRGBO(63, 54, 80, 1),
////                            fontSize: 18.0,
////                            fontWeight: FontWeight.normal),
////                      ),
////                    ),
////                  ),
////                ],
////              ),
////            ), // Email field
////            Container(
////              margin: const EdgeInsets.only(
////                  top: 32, bottom: 32, left: 33, right: 34),
////              child: Stack(
////                children: <Widget>[
////                  Text(
////                    "Your Password",
////                    style: new TextStyle(
////                        color: Color.fromRGBO(129, 121, 144, 1),
////                        fontSize: 14.0,
////                        fontWeight: FontWeight.normal),
////                  ),
////                  Container(
////                    margin: EdgeInsets.only(top: 9),
////                    child: TextField(
////                      obscureText: true,
////                      keyboardType: TextInputType.number,
////                      decoration: new InputDecoration(
////                        hintText: '***********',
////                        hintStyle: new TextStyle(
////                            color: Color.fromRGBO(63, 54, 80, 1),
////                            fontSize: 18.0,
////                            fontWeight: FontWeight.normal),
////                      ),
////                    ),
////                  ),
////                ],
////              ),
////            ),// Password Field
////            Container(
////              width: 344.0,
////              height: 48.0,
////              margin: EdgeInsets.only(
////                left: 33,
////                right: 33,
////              ),
////              child: RaisedButton(
////                  child: new Text(
////                    'Log in',
////                    style: new TextStyle(
////                        color: Colors.white,
////                        fontSize: 18.0,
////                        fontWeight: FontWeight.normal),
////                  ),
////                  onPressed: () {
////                    Navigator.pushNamed(context, "/firstLogin");
////                    // Navigator.pushNamed(context, '/dashboard');
////                  },
////                  color: Color.fromRGBO(137, 72, 252, 1)),
////            ), // Login Button
//            Container(
//              margin: const EdgeInsets.only(top: 22.0, right: 33),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  new GestureDetector(
//                      onTap: () {
//                        Navigator.pushNamed(context, "/resetPage");
//                      },
//                      child: Text(
//                        "Forgot your password?",
//                        style: new TextStyle(
//                            color: Color.fromRGBO(129, 121, 144, 1),
//                            fontSize: 14.0,
//                            fontWeight: FontWeight.normal),
//                      ))
//                ],
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}

//class LoginPage extends StatelessWidget {
//  final UserRepository userRepository;
//
//  LoginPage({Key key, @required this.userRepository})
//      : assert(userRepository != null),
//        super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        backgroundColor: Colors.white,
//        elevation: 0.0,
//        title: Text(
//          "Sign in",
//          style: new TextStyle(
//              color: Color.fromRGBO(34, 34, 34, 1),
//              fontSize: 24.0,
//              fontWeight: FontWeight.w500),
//        ),
//      ),
//      body: BlocProvider(
//        builder: (context) {
//          return LoginBloc(
//            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
//            userRepository: userRepository,
//          );
//        },
//        child: LoginForm(),
//      ),
//    );
//  }
//}

// TODO: To be refactored
//                  Container(
//                    margin: EdgeInsets.only(top: 9),
//                    child: TextField(
//                      keyboardType: TextInputType.emailAddress,
//                      decoration: new InputDecoration(
//                        hintText: 'sylviaamuda@gmail.com',
//                        hintStyle: new TextStyle(
//                            color: Color.fromRGBO(63, 54, 80, 1),
//                            fontSize: 18.0,
//                            fontWeight: FontWeight.normal),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ), // Email field
//            Container(
//              margin: const EdgeInsets.only(
//                  top: 32, bottom: 32, left: 33, right: 34),
//              child: Stack(
//                children: <Widget>[
//                  Text(
//                    "Your Password",
//                    style: new TextStyle(
//                        color: Color.fromRGBO(129, 121, 144, 1),
//                        fontSize: 14.0,
//                        fontWeight: FontWeight.normal),
//                  ),
//                  Container(
//                    margin: EdgeInsets.only(top: 9),
//                    child: TextField(
//                      obscureText: true,
//                      keyboardType: TextInputType.number,
//                      decoration: new InputDecoration(
//                        hintText: '***********',
//                        hintStyle: new TextStyle(
//                            color: Color.fromRGBO(63, 54, 80, 1),
//                            fontSize: 18.0,
//                            fontWeight: FontWeight.normal),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),// Password Field
//            Container(
//              width: 344.0,
//              height: 48.0,
//              margin: EdgeInsets.only(
//                left: 33,
//                right: 33,
//              ),
//              child: RaisedButton(
//                  child: new Text(
//                    'Log in',
//                    style: new TextStyle(
//                        color: Colors.white,
//                        fontSize: 18.0,
//                        fontWeight: FontWeight.normal),
//                  ),
//                  onPressed: () {
//                    Navigator.pushNamed(context, "/firstLogin");
//                    // Navigator.pushNamed(context, '/dashboard');
//                  },
//                  color: Color.fromRGBO(137, 72, 252, 1)),
//            ), // Login Button
