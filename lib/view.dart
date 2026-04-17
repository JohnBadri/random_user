import 'package:flutter/material.dart';
import 'package:random_user/view_model.dart';

class UserView extends StatelessWidget {
  UserView({super.key, required this.retrievedUser});

  final UserViewModel retrievedUser;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: retrievedUser,
      builder: (BuildContext context, child) {
        if (retrievedUser.isLoading) {
          return const CircularProgressIndicator.adaptive();
        } else if (retrievedUser.errorMessage != null) {
          return Center(child: Text(retrievedUser.errorMessage!));
        } else if (retrievedUser.user == null) {
          return const Center(
            child: Text('No user data yet. Press the button!'),
          );
        } else {
          return Column(
            spacing: 20.0,
            children: [
              Image.network(
                '${retrievedUser.user!.picture}',
              ),
              Text(
                'Name: ${retrievedUser.user!.fName} ${retrievedUser.user!.lName}',
              ),
              Text(
                'Location: ${retrievedUser.user!.city}, ${retrievedUser.user!.country}',
              ),
              Text(
                'Gender: ${retrievedUser.user!.gender}',
              ),
              Text(
                'Contact: ${retrievedUser.user!.email} and ${retrievedUser.user!.number}',
              ),
            ],
          );
        }
      },
    );
  }
}
