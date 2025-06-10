class Review {
  late int id;
  String content;
  int rating;
  String userName;
  String avatarUrl;
  DateTime createdAt;
  Review({
    required this.id,
    required this.content,
    required this.rating,
    required this.userName,
    required this.avatarUrl,
    required this.createdAt,
  });
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      content: json['content'],
      rating: json['rating'],
      userName: json['Users']['Name'],
      avatarUrl: json['Users']['profile_picture_url'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "content": content,
      "rating": rating,
      "user_name": userName,
      "avatar_url": avatarUrl,
      "created_at": createdAt.toIso8601String(),
    };
  }
}
