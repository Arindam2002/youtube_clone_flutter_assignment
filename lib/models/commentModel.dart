class Comment {
  final int count;
  final bool commentingAllowed;

  Comment({
    required this.count,
    required this.commentingAllowed,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      count: json['count'],
      commentingAllowed: json['commentingAllowed'],
    );
  }
}