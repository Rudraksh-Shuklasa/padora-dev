import 'package:flutter/material.dart';
import 'package:padora/auth/signup/block/ValidatorSignup.dart';
import 'package:padora/utils/constants/route_constansts.dart';
import 'package:padora/utils/navigation.dart';
import 'package:rxdart/rxdart.dart';

class SignupBlock extends Object with ValidatorSignup {
  final email = BehaviorSubject<String>();
  final password = BehaviorSubject<String>();
  final confromPassword=BehaviorSubject<String>();
  final firstName=BehaviorSubject<String>();
  final lastName=BehaviorSubject<String>();


  Stream<String> get emailStream => email.stream.transform(validateEmail);
  Stream<String> get passwordStream => password.stream.transform(validateEmail);
  Stream<String> get conformPasswordStream => confromPassword.stream.transform(validateEmail);
  Stream<String> get firstNameStream => firstName.stream.transform(validateEmail);
  Stream<String> get lastNameStream => lastName.stream.transform(validateEmail);
  Stream<bool>   get submitValue =>  Observable.combineLatest5(
      emailStream,
      passwordStream,
      conformPasswordStream,
      firstNameStream,
      lastNameStream,
          (a,b,c,d,e)=> true);


  Function(String) get changeEmail => email.sink.add;
  Function(String) get changePassword => password.sink.add;
  Function(String) get changeConformPassword => confromPassword.sink.add;
  Function(String) get changeFirstName => firstName.sink.add;
  Function(String) get changeLastName => lastName.sink.add;

  submitRegister(BuildContext context){
    NavigationUtils.push(context, ROUTE_REGISTER);
  }
  dispose() {
    email.close();
    password.close();
    confromPassword.close();
    firstName.close();
    lastName.close();
  }






}


