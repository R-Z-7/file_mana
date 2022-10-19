import 'package:file_mana/model/User.dart';
import 'package:file_mana/services/UserService.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var UserNameController = TextEditingController();
  var UserContactController = TextEditingController();
  var UserDescrController = TextEditingController();

  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDesc = false;

  var _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add User"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Add New Details",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: UserNameController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Name',
                      labelText: "Name",
                      errorText:
                          _validateName ? 'Value can\'t be empty' : null),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: UserContactController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Contact',
                      labelText: "Contact",
                      errorText: _validateContact
                          ? 'Conatct Value can\'t be empty'
                          : null),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: UserDescrController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Description',
                      labelText: "Description",
                      errorText: _validateDesc
                          ? 'Description Value can\'t be empty'
                          : null),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.teal),
                        onPressed: () async {
                          setState(() {
                            UserNameController.text.isEmpty
                                ? _validateName = true
                                : _validateName = false;
                            UserDescrController.text.isEmpty
                                ? _validateDesc = true
                                : _validateDesc = false;
                            UserContactController.text.isEmpty
                                ? _validateContact = true
                                : _validateContact = false;
                          });
                          if (_validateContact == false &&
                              _validateName == false &&
                              _validateDesc == false) {
                            //print("good");
                            var _user = User();
                            _user.name = UserNameController.text;
                            _user.description = UserDescrController.text;
                            _user.contact = UserContactController.text;

                            var result = await _userService.SaveUser(_user);
                            print(result);
                          }
                        },
                        child: const Text(
                          "Save Details",
                          style: TextStyle(fontSize: 20),
                        )),
                    const SizedBox(width: 20.0),
                    TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red),
                        onPressed: () {
                          UserDescrController.text = '';
                          UserContactController.text = '';
                          UserNameController.text = '';
                        },
                        child: const Text(
                          "Clear Details",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
