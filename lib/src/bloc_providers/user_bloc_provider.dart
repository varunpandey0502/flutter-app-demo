import 'package:flutter/material.dart';

import 'package:demo/src/blocs/user_bloc.dart';

class UserBlocProvider extends InheritedWidget {
  final UserBloc bloc;

  UserBlocProvider({Key key, Widget child})
      : bloc = UserBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UserBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UserBlocProvider)
            as UserBlocProvider)
        .bloc;
  }
}
