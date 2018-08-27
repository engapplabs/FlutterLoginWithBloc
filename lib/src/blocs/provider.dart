import 'package:flutter/material.dart';
import 'bloc.dart';

///Criamos o Provider
///Ele vai criar uma instancia da função Bloc
///E então, dentro da app.dart, ele se torna o pai do MaterialApp
///E TUDO dentro do MaterialApp terá acesso a função Bloc que criamos

class Provider extends InheritedWidget {
  //Sempre que fazemos uma nova instanciação de Provider
  //É gerado o Bloc
  final bloc = Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
