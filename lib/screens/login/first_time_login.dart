import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow/blocs/authentication/authentication.dart';

class FirstTimeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        backgroundColor: Color.fromRGBO(246, 241, 255, 1),
//        elevation: 0.0,
//      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
                height: 214.0,
                color: Color.fromRGBO(246, 241, 255, 1),
                //alignment: Alignment.center,

                child: Image.asset('images/first-login.png')),
            Container(
              margin: const EdgeInsets.only(top: 33, left: 36),
              height: 80.0,
              width: 188.0,
              child: Text(
                'Welcome to\nSwipeNG!',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(top: 27.0, bottom: 58.0, left: 36.0),
              width: 322.6,
              height: 89.0,
              child: Text(
                'Before you start saving and paying for\nthings online, we will like to set up your\nprofile picture and phone number to get you ready.',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(129, 121, 144, 1)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 36.0, right: 36.0, bottom: 79.0),
              width: 344.0,
              height: 48.0,
              child: RaisedButton(
                child: new Text(
                  'Let\'s Go!',
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal),
                ),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedInLetsGo());
                  //  Navigator.pushNamed(context, '/verifyIdentity');
//                  return TransactionSearch();
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => CameraApp()),
//                  );
//                  Navigator.pushNamed(context, '/transactionSearch');
                },
                color: Color.fromRGBO(137, 72, 252, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
