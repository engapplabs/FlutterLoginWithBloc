import 'dart:async';
import 'validator.dart';

//Nossa classe BLOC para gerenciar os controladores
class Bloc extends Validators {
  final _email = StreamController<String>(); //Controlador de email
  final _password = StreamController<String>(); //Controlador de senha

  //Adicionar uma mudança ao StreamController
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //Recuperar os dados da stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  dispose() {
    _email.close();
    _password.close();
  }
}
