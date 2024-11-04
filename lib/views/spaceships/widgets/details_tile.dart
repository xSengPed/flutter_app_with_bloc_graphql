import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  final String title;
  final String subTitle;
  const DetailTile({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(title),
            const Spacer(),
            Text(subTitle),
          ],
        ),
      ),
    );
  }
}
