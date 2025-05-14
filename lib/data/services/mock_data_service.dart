import '../../features/shop/models/category.dart';
import '../../features/shop/models/product.dart';

class MockDataService {
  static List<Category> getCategories() {
    return [
      Category(
        id: '1',
        name: 'Electronics',
        description: 'Electronic devices and gadgets',
        imageUrl: 'assets/categories/electronics.jpg',
        keywords: ['phone', 'laptop', 'computer', 'tablet', 'camera', 'headphones', 'speaker'],
      ),
      Category(
        id: '2',
        name: 'Furniture',
        description: 'Home and office furniture',
        imageUrl: 'assets/categories/furniture.jpg',
        keywords: ['chair', 'table', 'sofa', 'bed', 'desk', 'cabinet', 'shelf'],
      ),
      Category(
        id: '3',
        name: 'Clothing',
        description: 'Fashion and apparel',
        imageUrl: 'assets/categories/clothing.jpg',
        keywords: ['shirt', 'pants', 'dress', 'shoes', 'jacket', 'hat', 'bag'],
      ),
      Category(
        id: '4',
        name: 'Home & Garden',
        description: 'Home improvement and gardening',
        imageUrl: 'assets/categories/home_garden.jpg',
        keywords: ['plant', 'flower', 'pot', 'tool', 'lamp', 'vase', 'decoration'],
      ),
      Category(
        id: '5',
        name: 'Sports',
        description: 'Sports and fitness equipment',
        imageUrl: 'assets/categories/sports.jpg',
        keywords: ['ball', 'bike', 'gym', 'fitness', 'running', 'tennis', 'basketball'],
      ),
    ];
  }

  static List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: 'iPhone 15 Pro',
        description: 'Latest iPhone with advanced camera system',
        imageUrl: 'assets/products/iphone.jpg',
        price: 999,
        category: 'Electronics',
        isAvailable: true,
      ),
      Product(
        id: '2',
        name: 'MacBook Air M2',
        description: 'Powerful laptop for work and creativity',
        imageUrl: 'assets/products/macbook.jpg',
        price: 1199,
        category: 'Electronics',
        isAvailable: true,
      ),
      Product(
        id: '3',
        name: 'Ergonomic Office Chair',
        description: 'Comfortable chair for long work sessions',
        imageUrl: 'assets/products/chair.jpg',
        price: 299,
        category: 'Furniture',
        isAvailable: true,
      ),
      Product(
        id: '4',
        name: 'Wooden Dining Table',
        description: 'Elegant dining table for family meals',
        imageUrl: 'assets/products/table.jpg',
        price: 599,
        category: 'Furniture',
        isAvailable: true,
      ),
      Product(
        id: '5',
        name: 'Nike Running Shoes',
        description: 'Comfortable shoes for daily running',
        imageUrl: 'assets/products/shoes.jpg',
        price: 129,
        category: 'Clothing',
        isAvailable: true,
      ),
    ];
  }

  static List<Product> searchProductsByKeywords(List<String> keywords) {
    final products = getProducts();
    final categories = getCategories();
    
    return products.where((product) {
      // Check if product name contains any keyword
      final productNameLower = product.name.toLowerCase();
      final productDescLower = product.description.toLowerCase();
      
      for (String keyword in keywords) {
        final keywordLower = keyword.toLowerCase();
        if (productNameLower.contains(keywordLower) || 
            productDescLower.contains(keywordLower)) {
          return true;
        }
      }
      
      // Check if product category matches any keyword
      final category = categories.firstWhere(
        (cat) => cat.name == product.category,
        orElse: () => categories.first,
      );
      
      for (String keyword in keywords) {
        final keywordLower = keyword.toLowerCase();
        if (category.keywords.any((catKeyword) => 
            catKeyword.toLowerCase().contains(keywordLower))) {
          return true;
        }
      }
      
      return false;
    }).toList();
  }
}
