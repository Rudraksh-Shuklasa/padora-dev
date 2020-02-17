
import 'dart:async';

class ValidatorLogin {
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
}