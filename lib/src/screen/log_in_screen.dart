import 'package:flutter/material.dart';
import 'package:hishamoo2/src/bloc/bloc.dart';
import 'package:hishamoo2/src/bloc/provider.dart';

class loginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(children: <Widget>[
        EmailField(bloc),
        PassField(bloc),
        Container(padding: EdgeInsets.only(bottom: 25.0)),
        submitbutton(bloc),
        Container(padding: EdgeInsets.only(bottom: 25.0)),
        StreamBuilder(
          stream: bloc.loginstream,
          builder: (context, snapshot2) {
            if (snapshot2.hasData) {
              print("server say  " + snapshot2.data.toString());
            }
            return Container();
          },
        ),
        Center()
      ]),
    );
  }

  EmailField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.Emailstream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            decoration: InputDecoration(
                icon: Icon(Icons.verified_user),
                errorText: snapshot.error,
                labelText: 'Email',
                hintText: 'blabla@bla.com'),
          );
        });
  }

  PassField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passstream,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            onChanged: bloc.changepass,
            decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                errorText: snapshot.error,
                labelText: 'password',
                hintText: '*****'),
          );
        });
  }

  submitbutton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return IgnorePointer(
            ignoring: !snapshot.hasData,
            child: RaisedButton(
              child: Text('Log in'),
              onPressed: () {
                bloc.loginpress(true);
              },
            ),
          );
        });
  }
}
