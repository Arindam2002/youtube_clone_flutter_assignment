import 'package:flutter/material.dart';

import '../models/postModel.dart';
import 'ActionButtonComponent.dart';

class ActionButtonsInShortsComponent extends StatefulWidget {
  const ActionButtonsInShortsComponent({Key? key, required this.post})
      : super(key: key);

  final Post post;

  @override
  State<ActionButtonsInShortsComponent> createState() =>
      _ActionButtonsInShortsComponentState();
}

class _ActionButtonsInShortsComponentState
    extends State<ActionButtonsInShortsComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ActionButtonComponent(icon: Icon(
            Icons.thumb_up,
            color: widget.post.reaction.voted
                ? Colors.blueAccent
                : Colors.white,
            size: 30,
          ), iconText: (widget.post.reaction.count).toString(),),
          ActionButtonComponent(icon: Icon(Icons.thumb_down, color: Colors.white, size: 30,), iconText: 'Dislike'),
          ActionButtonComponent(icon: Icon(widget.post.comment.commentingAllowed ? Icons.comment : Icons.comments_disabled, color: Colors.white, size: 30,), iconText: (widget.post.comment.count).toString()),
          ActionButtonComponent(icon: Icon(Icons.share, color: Colors.white, size: 30,), iconText: 'Share'),
          ActionButtonComponent(icon: Icon(Icons.shuffle, color: Colors.white, size: 30,), iconText: 'Remix'),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
