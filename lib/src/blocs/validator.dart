import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      // Se houver, tudo bem continue
      sink.add(email);
    } else {
      sink.addError("Email inválido");
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      // Se houver, tudo bem continue
      sink.add(password);
    } else {
      sink.addError("Senha pequena");
    }
  });
}
