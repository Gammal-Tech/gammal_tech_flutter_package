import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExamElement extends StatefulWidget {
  final String title;
  final String youtubeVideoAdress;
  const ExamElement({
    Key? key,
    required this.title,
    required this.youtubeVideoAdress,
  }) : super(key: key);

  @override
  State<ExamElement> createState() => _ExamElementState();
}

class _ExamElementState extends State<ExamElement> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller =
        YoutubePlayerController(initialVideoId: widget.youtubeVideoAdress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 220,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              YoutubePlayer(
                  bottomActions: [], width: 300, controller: _controller),
              SizedBox(
                height: 10,
              ),
              Text(widget.title),
            ],
          ),
        ));
  }
}
