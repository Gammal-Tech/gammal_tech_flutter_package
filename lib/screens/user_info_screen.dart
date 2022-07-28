import 'package:flutter/material.dart';
import '../providers/users.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatelessWidget {
  final String userId;
  const UserInfoScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context).findById(userId);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              user.profilePictureUrl,
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.name,
            style: const TextStyle(
                color: Colors.teal, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            user.profession,
            style: const TextStyle(
                color: Colors.teal, fontWeight: FontWeight.w400),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(user.bio),
        ],
      ),
    );
  }
}
