import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';

class ExperienceElement extends StatelessWidget {
  final String title;
  final String imageUrl;
  const ExperienceElement({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Column(children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: [
              WidgetSpan(
                child: Icon(
                  Icons.check_circle_outline_outlined,
                  size: 16,
                ),
              ),
              TextSpan(
                text: '${title}',
                style: const TextStyle(color: Colors.teal, fontSize: 17),
              )
            ]),
          ),
          GalleryImage(
            imageUrls: [imageUrl],
            numOfShowImages: 1,
            titleGallery: title,
          ),
        ]),
      ),
    );
  }
}
