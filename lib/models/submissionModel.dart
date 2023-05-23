class Submission {
  final String title;
  final String description;
  final String mediaUrl;
  final String thumbnail;
  final String hyperlink;
  final String placeholderUrl;

  Submission({
    required this.title,
    required this.description,
    required this.mediaUrl,
    required this.thumbnail,
    required this.hyperlink,
    required this.placeholderUrl,
  });

  factory Submission.fromJson(Map<String, dynamic> json) {
    return Submission(
      title: json['title'],
      description: json['description'],
      mediaUrl: json['mediaUrl'],
      thumbnail: json['thumbnail'],
      hyperlink: json['hyperlink'],
      placeholderUrl: json['placeholderUrl'],
    );
  }
}