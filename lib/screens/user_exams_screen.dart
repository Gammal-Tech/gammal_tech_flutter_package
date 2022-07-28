import 'package:flutter/material.dart';
import '../providers/users.dart';
import '../widgets/exams_element.dart';
import 'package:provider/provider.dart';

class ExamsScreen extends StatelessWidget {
  final String userId;
  const ExamsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context).findById(userId);
    List<Map<String, String>> userExams =
        user.exams as List<Map<String, String>>;
    return ListView.builder(
        itemCount: userExams.length,
        itemBuilder: (ctx, index) {
          return ExamElement(
              title: userExams[index]['title']!,
              youtubeVideoAdress: userExams[index]['youtubeVideoAdress']!);
        });
  }
}
