import 'package:flutter/material.dart';
import '../providers/users.dart';
import '../widgets/users_list.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  static const routeName = '/users-screen';
  Widget? screen1;
  Widget? screen2;
  Widget? screen3;
  Widget? screen4;
  String? title1;
  String? title2;
  String? title3;
  String? title4;

  UsersScreen({
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
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool x = true;
  bool isLoading = true;
  @override
  void didChangeDependencies() {
    if (x) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Users>(context).fetchUsers().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    x = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          'Users',
          style: TextStyle(
            color: Colors.teal,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : UsersList(
              screen1: widget.screen1,
              screen2: widget.screen2,
              screen3: widget.screen3,
              screen4: widget.screen4,
              title1: widget.title1,
              title2: widget.title2,
              title3: widget.title3,
              title4: widget.title4,
            ),
    );
  }
}
