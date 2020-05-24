import 'package:flutter/cupertino.dart';
import 'package:hishamoo2/src/Repository/authRepository.dart';
import 'package:hishamoo2/src/network/apiprovider.dart';

import 'basebloc.dart';
import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Valdiator implements BlocBase {
  final _Email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _Action = BehaviorSubject();
  final _login = BehaviorSubject<bool>();
  String lastname = "";
  String lastpassword = "";

  Function(String) get changeEmail => _Email.sink.add;
  Function(String) get changepass => _password.sink.add;
  Function get loginpress => _login.sink.add;
  //Function(String) get changepass => _password.sink.add;
  Stream<bool> get loginstream =>
      _login.stream.transform(StreamTransformer<bool, bool>.fromHandlers(
          handleData: (data, sink) async {
        String mail = await Emailstream.first;
        String pass = await passstream.first;

        authRepository auth = new authRepository();
        var res = await auth.login(mail, pass);
        print(res);
        sink.add(res);
      }));

  Stream<String> get Emailstream => _Email.stream.transform(validateEmail);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(Emailstream, passstream, (a, b) => true);
  Stream<String> get passstream => _password.stream.transform(validatepass);

  @override
  void dispose() {
    _Email.close();
    _password.close();
  }
}
