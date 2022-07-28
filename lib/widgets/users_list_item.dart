import 'package:flutter/material.dart';
import '../providers/user.dart';
import '../screens/user_profile_screen.dart';
import 'package:provider/provider.dart';

class UserListItem extends StatelessWidget {
  Widget? screen1;
  Widget? screen2;
  Widget? screen3;
  Widget? screen4;
  String? title1;
  String? title2;
  String? title3;
  String? title4;
  final String id;

  UserListItem({
    required this.id,
    this.screen1,
    this.screen2,
    this.screen3,
    this.screen4,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          user.profilePictureUrl,
        ),
      ),
      title: Text(user.name),
      subtitle: Text(user.profession),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return UserProfileScreen(
            id: user.id,
            screen1: screen1,
            screen2: screen2,
            screen3: screen3,
            screen4: screen4,
            title1: title1,
            title2: title2,
            title3: title3,
            title4: title4,
          );
        }));
      },
    );
  }
}
