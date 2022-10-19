import 'package:file_mana/model/User.dart';
import 'package:file_mana/screens/AddUser.dart';
import 'package:file_mana/services/UserService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<User> _userList;
  final _userService = UserService();
  getAlluserdetails() async {
    var users = await _userService.readAllUsers();
    _userList = <User>[];
    users.forEach((user) {
      setState(() {
        var usersModel = User();
        usersModel.id = user['id'];
        usersModel.name = user['name'];
        usersModel.contact = user['contact'];
        usersModel.description = user['description'];
        usersModel.contact = user['contact'];
        _userList.add(usersModel);
      });
    });
  }

  @override
  void initState() {
    getAlluserdetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Start"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            itemCount: _userList.length,
            itemBuilder: ((context, index) {
              return Card();
            })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        child: const Text("Start"),
      ),
    );
  }
}
