class Reaction {
  final int count;
  final bool voted;

  Reaction({
    required this.count,
    required this.voted,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      count: json['count'],
      voted: json['voted'],
    );
  }
}