class Category {
  int categoryId;
  String name;
  String iconPath;
  Category(this.categoryId, this.name, this.iconPath);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(json['category_id'], json['name'], json['iconPath']);
  }
  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'iconPath': iconPath,
    };
  }
}
