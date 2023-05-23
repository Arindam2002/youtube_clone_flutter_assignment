import 'package:flutter/material.dart';

import '../models/postModel.dart';

class ShortDetail extends StatefulWidget {
  const ShortDetail({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<ShortDetail> createState() => _ShortDetailState();
}

class _ShortDetailState extends State<ShortDetail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      child: ListTile(
        title: Text(
          '@${widget.post.creator.handle}',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          softWrap: true,
        ),
        subtitle: Text(
          widget.post.submission.title,
          style: TextStyle(fontSize: 12, color: Colors.white),
          softWrap: true,
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.post.creator.pic),
        ),
      ),
    );
  }
}
