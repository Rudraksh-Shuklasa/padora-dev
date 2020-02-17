
import 'dart:async';

import 'package:padora/auth/login/block/login_block.dart';
import 'package:padora/auth/signup/block/signup_block.dart';

class ValidatorSignup {
  final validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.contains('@')) {
      sink.add(value);
    } else if(value.length == 0){
      sink.addError("email not allow to null");
    }else {
      sink.addError("This is not valid email");
    }
  });


  final validatePassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if(value.isEmpty)
    {
      sink.addError("password not be null");
    }
    else if (value.length > 4) {
      sink.add(value);
    } else {
      sink.addError("password must be more than 5");
    }
  });

  final validateFirstName =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if(value.isEmpty)
    {
      sink.addError("first name is not be empty");
    }
    else {
      sink.add(value);
    }
  });


  final validateLastName =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if(value.isEmpty)
    {
      sink.addError("last name is not be empty");
    }
    else {
      sink.add(value);
    }
  });

  final validateConfromPassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if(value.isEmpty){
      sink.addError("password is not be empty");
    }
    else if(value.compareTo(SignupBlock().password.value)!=0)
    {
      sink.addError("Password and confrom password mustbe same");
    }
    else {
      sink.add(value);
    }
  });
}