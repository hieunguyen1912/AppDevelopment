# MobileDevApp_N05

![image](https://github.com/user-attachments/assets/8595881d-83cd-4d9a-91b2-41e84bf7951f)

![image](https://github.com/user-attachments/assets/1ee9a77d-e8f7-4947-9785-e0b320b2a710)

![Screenshot 2025-01-06 145132](https://github.com/user-attachments/assets/23b383cc-c44c-4093-bf61-feb2ad991daf)
![Screenshot 2025-01-06 145123](https://github.com/user-attachments/assets/9e79ad3d-00e2-41c0-9321-7d15b7f23e4f)
![Screenshot 2025-01-06 145103](https://github.com/user-attachments/assets/39443058-460c-4d00-881d-804808481782)
![Screenshot 2025-01-06 145048](https://github.com/user-attachments/assets/7ba6f511-96f1-4ba5-b82a-c861fadf755c)

![image](https://github.com/user-attachments/assets/bb875f43-ade8-4b5a-9e9b-3b2a41b07812)

## main.dart
```dart
import 'package:flutter/material.dart';

class User {
  String username;
  String password;
  String role;

  User({required this.username, required this.password, required this.role});
}

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'Viewer';
  List<User> users = [];

  void _addUser() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        users.add(
          User(
            username: _usernameController.text,
            password: _passwordController.text,
            role: _selectedRole,
          ),
        );
        _usernameController.clear();
        _passwordController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã thêm người dùng!')),
        );
      });
    }
  }

  void _editUser(
      int index, String newUsername, String newPassword, String newRole) {
    setState(() {
      users[index].username = newUsername;
      users[index].password = newPassword;
      users[index].role = newRole;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Đã sửa người dùng!')));
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Đã xóa người dùng!')));
  }

  void _showUserList(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Danh sách người dùng'),
          content: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.7,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Tên đăng nhập')),
                  DataColumn(label: Text('Mật khẩu')),
                  DataColumn(label: Text('Vai trò')),
                  DataColumn(label: Text('')),
                ],
                rows: List<DataRow>.generate(
                  users.length,
                  (index) => DataRow(
                    cells: <DataCell>[
                      DataCell(TextFormField(
                        initialValue: users[index].username,
                        onChanged: (newValue) {
                          users[index].username = newValue;
                        },
                      )),
                      DataCell(TextFormField(
                        initialValue: users[index].password,
                        onChanged: (newValue) {
                          users[index].password = newValue;
                        },
                      )),
                      DataCell(DropdownButtonFormField<String>(
                        value: users[index].role,
                        onChanged: (newValue) {
                          users[index].role = newValue!;
                        },
                        items: <String>['Admin', 'Editor', 'Viewer']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.save),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Đã lưu thay đổi!')));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteUser(index),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Đóng'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý người dùng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên đăng nhập';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Mật khẩu'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Vai trò'),
                value: _selectedRole,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRole = newValue!;
                  });
                },
                items: <String>['Admin', 'Editor', 'Viewer']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: _addUser,
                      child: const Text('Thêm người dùng'),
                    ),
                    ElevatedButton(
                      onPressed: () => _showUserList(context),
                      child: const Text('Xem danh sách'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

