import 'package:flutter/material.dart';
import '../providers/users.dart';
import '../widgets/users_list_item.dart';
import 'package:provider/provider.dart';

class UsersList extends StatelessWidget {
  Widget? screen1;
  Widget? screen2;
  Widget? screen3;
  Widget? screen4;
  String? title1;
  String? title2;
  String? title3;
  String? title4;

  UsersList({
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
    final users = Provider.of<Users>(context).users;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: users[index],
          child: UserListItem(
            id: users[index].id,
            screen1: screen1,
            screen2: screen2,
            screen3: screen3,
            screen4: screen4,
            title1: title1,
            title2: title2,
            title3: title3,
            title4: title4,
          ),
        );
      },
    );
  }
}
