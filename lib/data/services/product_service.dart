import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/shop/models/product.dart';

class ProductService {
  final _productsRef = FirebaseFirestore.instance.collection('products');

  Stream<List<Product>> getAllProducts() {
    return _productsRef.snapshots().map(
      (snapshot) =>
          snapshot.docs
              .map((doc) => Product.fromMap(doc.data(), doc.id))
              .toList(),
    );
  }

  Future<void> addProduct(Product product) async {
    await _productsRef.add(product.toMap());
  }
}
