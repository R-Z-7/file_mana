// ignore_for_file: non_constant_identifier_names

import 'package:file_mana/db/repository.dart';
import 'package:file_mana/model/User.dart';

class UserService {
  late Repository _repository;
  UserService() {
    _repository = Repository();
  }
  //Save User
  SaveUser(User user) async {
    return await _repository.insertData('users', user.userMap());
  }

  // //Read All Users
  readAllUsers() async {
    return await _repository.readData('users');
  }
}
