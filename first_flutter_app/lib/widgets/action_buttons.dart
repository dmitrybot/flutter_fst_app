

import 'package:first_flutter_app/bloc/user_bloc.dart';
import 'package:first_flutter_app/bloc/user_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text("Load"),
          onPressed: (){
            userBloc.add(UserLoadEvent());
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text("Clear"),
          onPressed: (){
            userBloc.add(UserClearEvent());
          },
          color: Colors.red,
        ),
      ],
    );
  }

}