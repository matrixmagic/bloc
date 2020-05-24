import 'package:flutter/material.dart';
import 'package:hishamoo2/src/screen/log_in_screen.dart';

import 'bloc/bloc.dart';
import 'bloc/provider.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        bloc: LoginBloc(),
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('log in'),
            ),
            body: loginScreen(),
          ),
        ));
  }
}
