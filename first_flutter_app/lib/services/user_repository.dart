
import 'package:first_flutter_app/models/User.dart';
import 'package:first_flutter_app/services/user_api_provider.dart';

class UserRepository{
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();

}