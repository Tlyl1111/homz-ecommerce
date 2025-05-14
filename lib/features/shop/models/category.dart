class Category {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> keywords;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.keywords,
  });

  factory Category.fromMap(Map<String, dynamic> data, String id) => Category(
    id: id,
    name: data['name'],
    description: data['description'],
    imageUrl: data['imageUrl'],
    keywords: List<String>.from(data['keywords'] ?? []),
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'description': description,
    'imageUrl': imageUrl,
    'keywords': keywords,
  };
}
