import 'package:first_flutter_app/bloc/user_bloc.dart';
import 'package:first_flutter_app/bloc/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              "No data teceived",
            ),
          );
        }
        if (state is UserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (BuildContext context, int index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedUser[index].id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Column(
                  children: <Widget>[
                    Text(
                      '${state.loadedUser[index].name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${state.loadedUser[index].email}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          '${state.loadedUser[index].phone}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: Text(
            "Error",
          ),
        );
      },
    );
  }
}
