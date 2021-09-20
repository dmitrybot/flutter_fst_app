import 'package:first_flutter_app/bloc/user_event.dart';
import 'package:first_flutter_app/models/User.dart';
import 'package:first_flutter_app/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository usersRepository;


  UserBloc({required this.usersRepository}) : assert(usersRepository != null), super(UserEmptyState());

  @override
  UserState get initialState => UserEmptyState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
    if (event is UserLoadEvent){
      yield UserLoadingState();
      try{
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_){
        yield UserErrorState();
      }
    } else if (event is UserClearEvent){
      yield UserEmptyState();
    }
  }

}