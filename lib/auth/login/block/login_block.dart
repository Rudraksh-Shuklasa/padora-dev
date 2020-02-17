import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:padora/auth/login/block/validator_login.dart';
import 'package:padora/utils/constants/route_constansts.dart';
import 'package:padora/utils/navigation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginBlock extends Object with ValidatorLogin implements BaseBloc{

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;
  FirebaseUser myUser;
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();


  final GoogleSignIn googleSignIn = GoogleSignIn();

  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream => _password.stream.transform(validatePassword);
  Stream<bool>   get submitValue =>  Observable.combineLatest2(emailStream, passwordStream, (a, b)=> true);

  Function(String) get ChangeEmail => _email.sink.add;
  Function(String) get ChangePassword => _password.sink.add;


  String name;
  String email;
  String imageUrl;

  submitLogin(BuildContext context){
    NavigationUtils.push(context, ROUTE_REGISTER);
  }

  Future<int> handleSignIn( ) async {

        FacebookLoginResult facebookLoginResult = await _handleFBSignIn();
        final accessToken = facebookLoginResult.accessToken.toString();
        if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
          final facebookAuthCred =
          FacebookAuthProvider.getCredential(accessToken: accessToken);
          final user =
          await _auth.signInWithCredential(facebookAuthCred);
          print("User : " + user.toString());
          return 1;
        } else
          return 0;


  }

  Future<FacebookLoginResult> _handleFBSignIn() async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancelledByUser:
        print("Cancelled");
        break;
      case FacebookLoginStatus.error:
        print(FacebookLoginStatus.error);
        break;
      case FacebookLoginStatus.loggedIn:
        print("Logged In");
        break;
    }
    return facebookLoginResult;
  }


  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoUrl;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return Future.value(user.email);
  }

  dispose() {
    _email.close();
    _password.close();
  }



}

abstract class BaseBloc {
  void dispose();
}