import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter_application_1/data/services/mock_data_service.dart';
import 'package:flutter_application_1/data/services/gemini_service.dart';
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
  String _productName = '';
  double _confidence = 0.0;
  String _analysisDescription = '';
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _analyzeImage();
  }

  Future<void> _analyzeImage() async {
    try {
      // Use Gemini AI to analyze the image
      final analysisResult = await GeminiService.analyzeProductImage(widget.imagePath);
      
      // Extract analysis results
      final keywords = List<String>.from(analysisResult['keywords'] ?? []);
      
      // Search for matching products using the AI-detected keywords
      List<Product> results = MockDataService.searchProductsByKeywords(keywords);
      
      setState(() {
        _matchingProducts = results;
        _detectedCategory = analysisResult['category'] ?? 'General';
        _productName = analysisResult['productName'] ?? 'Unknown Product';
        _confidence = (analysisResult['confidence'] ?? 0.0).toDouble();
        _analysisDescription = analysisResult['description'] ?? '';
        _suggestions = List<String>.from(analysisResult['suggestions'] ?? []);
        _isAnalyzing = false;
      });
    } catch (e) {
      print('Analysis error: $e');
      setState(() {
        _detectedCategory = 'Error';
        _productName = 'Analysis Failed';
        _confidence = 0.0;
        _analysisDescription = 'Failed to analyze image: $e';
        _isAnalyzing = false;
      });
    }
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
                  Text('Analyzing image with AI...'),
                ],
              ),
            ),
          ] else ...[
            // AI Analysis Results
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.smart_toy, color: HColors.green500),
                          const SizedBox(width: 8),
                          Text(
                            'AI Analysis',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Product: $_productName',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text('Category: $_detectedCategory'),
                          const Spacer(),
                          Text(
                            'Confidence: ${(_confidence * 100).toInt()}%',
                            style: TextStyle(
                              color: _confidence > 0.7 ? Colors.green : 
                                     _confidence > 0.4 ? Colors.orange : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (_analysisDescription.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          _analysisDescription,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
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
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.search_off, size: 64, color: Colors.grey),
                          const SizedBox(height: 16),
                          const Text('No matching products found'),
                          if (_suggestions.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            const Text('Try searching for:'),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              children: _suggestions.map((suggestion) =>
                                Chip(
                                  label: Text(suggestion),
                                  backgroundColor: HColors.green500.withOpacity(0.1),
                                ),
                              ).toList(),
                            ),
                          ],
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
