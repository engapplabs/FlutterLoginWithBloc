import 'package:flutter/material.dart';
import '../../blocs/bloc.dart';
import '../../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return new Container(
        margin: new EdgeInsets.all(20.0),
        child: new Column(children: [
          emailField(bloc),
          passwordField(bloc),
          new SizedBox(height: 10.0),
          submitButton(),
        ]));
  }

  Widget emailField(Bloc bloc) {
    return new StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return new TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email',
            errorText: snapshot.error,
          ),
        );
      },
    ); 
  }

  Widget passwordField(Bloc bloc) {
    return new StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          new TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: new InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget submitButton() {
    return new RaisedButton(
      child: new Text('Login'),
      color: Colors.blue,
      onPressed: () {},
    );
  }
}
