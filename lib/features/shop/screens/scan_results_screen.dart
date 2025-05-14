import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter_application_1/data/services/mock_data_service.dart';
import 'package:flutter_application_1/features/shop/models/product.dart';
import 'package:get/get.dart';

class ScanResultsScreen extends StatefulWidget {
  final String imagePath;

  const ScanResultsScreen({super.key, required this.imagePath});

  @override
  State<ScanResultsScreen> createState() => _ScanResultsScreenState();
}

class _ScanResultsScreenState extends State<ScanResultsScreen> {
  List<Product> _matchingProducts = [];
  bool _isAnalyzing = true;
  String _detectedCategory = '';

  @override
  void initState() {
    super.initState();
    _analyzeImage();
  }

  Future<void> _analyzeImage() async {
    // Simulate image analysis delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock AI analysis - in real app, this would call an AI service
    List<String> mockDetectedKeywords = _getMockAnalysisResult();
    
    // Search for matching products
    List<Product> results = MockDataService.searchProductsByKeywords(mockDetectedKeywords);
    
    setState(() {
      _matchingProducts = results;
      _detectedCategory = _getCategoryFromKeywords(mockDetectedKeywords);
      _isAnalyzing = false;
    });
  }

  List<String> _getMockAnalysisResult() {
    // Mock different results based on time to simulate variety
    final scenarios = [
      ['phone', 'electronics', 'mobile'],
      ['chair', 'furniture', 'office'],
      ['shoes', 'clothing', 'sneakers'],
      ['laptop', 'computer', 'electronics'],
      ['table', 'furniture', 'wooden'],
    ];
    
    final randomIndex = DateTime.now().millisecond % scenarios.length;
    return scenarios[randomIndex];
  }

  String _getCategoryFromKeywords(List<String> keywords) {
    final categories = MockDataService.getCategories();
    
    for (var category in categories) {
      for (var keyword in keywords) {
        if (category.keywords.contains(keyword.toLowerCase()) ||
            category.name.toLowerCase().contains(keyword.toLowerCase())) {
          return category.name;
        }
      }
    }
    
    return 'General';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Results'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Captured Image Preview
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: HColors.grey),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Analysis Status
          if (_isAnalyzing) ...[
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircularProgressIndicator(color: HColors.green500),
                  SizedBox(height: 16),
                  Text('Analyzing image...'),
                ],
              ),
            ),
          ] else ...[
            // Results Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.category, color: HColors.green500),
                  const SizedBox(width: 8),
                  Text(
                    'Category: $_detectedCategory',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Matching Products (${_matchingProducts.length})',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Products List
            Expanded(
              child: _matchingProducts.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No matching products found'),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _matchingProducts.length,
                      itemBuilder: (context, index) {
                        final product = _matchingProducts[index];
                        return _ProductCard(product: product);
                      },
                    ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: !_isAnalyzing
          ? Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Scan Another Product'),
              ),
            )
          : null,
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Product Image Placeholder
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: HColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, color: Colors.grey),
            ),
            
            const SizedBox(width: 12),
            
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: HColors.green500,
                    ),
                  ),
                ],
              ),
            ),
            
            // Action Button
            IconButton(
              onPressed: () {
                // Navigate to product details or add to cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} selected')),
                );
              },
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
