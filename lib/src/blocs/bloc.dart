import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

// para adicionar uma validação à classe Bloc
class Bloc extends Object with Validators {
  // marcados como privado_ para só poderem acessar as funções definidas abaixo
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // para eu não ter que sempre digitar bloc.emailController.sink.add()
  // utilizo o get para substituir essa funcao por uma mais simples, para adicionar dados ao stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // da mesma forma utilizo aqui para receber os dados do stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email é $validEmail e senha $validPassword');
  }

  // fará a limpeza de diferentes variáveis ou objetos que forem criados por nossa classe
  dispose() {
    _email.close();
    _password.close();
  }
}

// permite acessarmos o nosso bloco de qualquer lugar, para aplicativos pequenos
// final bloc = Bloc();
