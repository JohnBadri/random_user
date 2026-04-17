import 'package:flutter/material.dart';
import 'package:random_user/view.dart';
import 'package:random_user/view_model.dart';

void main() {
  runApp(const MainApp());
}

final UserViewModel viewModel = UserViewModel();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Get A Random User'),
          centerTitle: true,
        ),
        body: Center(
          child: UserView(
            retrievedUser: viewModel,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.getRandomUser();
          },
          child: Icon(Icons.account_box),
        ),
      ),
    );
  }
}
