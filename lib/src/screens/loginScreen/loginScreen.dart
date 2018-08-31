import 'package:flutter/material.dart';
import '../../blocs/bloc.dart';
import '../../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return new Container(
      margin: new EdgeInsets.all(20.0),
      child: new Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          new SizedBox(height: 10.0),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            /*onChanged: (newValue){
            bloc.changeEmail(newValue);
          },*/
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@email.com',
              labelText: 'Email',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Senha',
              labelText: 'Senha',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Entrar'),
          color: Colors.blue,
          onPressed: snapshot.hasError
              ? null
              : () {
                  print("Oi");
                },
        );
      },
    );
  }
}
