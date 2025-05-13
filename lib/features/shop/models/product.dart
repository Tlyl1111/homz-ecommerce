class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final String category;
  final bool isAvailable;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.isAvailable,
  });

  factory Product.fromMap(Map<String, dynamic> data, String id) => Product(
    id: id,
    name: data['name'],
    description: data['description'],
    imageUrl: data['imageUrl'],
    price: data['price'],
    category: data['category'],
    isAvailable: data['isAvailable'],
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'description': description,
    'imageUrl': imageUrl,
    'price': price,
    'category': category,
    'isAvailable': isAvailable,
  };
}
