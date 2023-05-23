import 'package:youtube_shorts_clone/models/reactionModel.dart';
import 'package:youtube_shorts_clone/models/submissionModel.dart';
import 'package:youtube_shorts_clone/models/commentModel.dart';
import 'creatorModel.dart';

class Post {
  final String postId;
  final Creator creator;
  final Comment comment;
  final Reaction reaction;
  final Submission submission;

  Post({
    required this.postId,
    required this.creator,
    required this.comment,
    required this.reaction,
    required this.submission,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      creator: Creator.fromJson(json['creator']),
      comment: Comment.fromJson(json['comment']),
      reaction: Reaction.fromJson(json['reaction']),
      submission: Submission.fromJson(json['submission']),
    );
  }
}