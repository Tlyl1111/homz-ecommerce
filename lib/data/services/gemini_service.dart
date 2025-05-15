import 'dart:io';
import 'dart:typed_data';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  static late final GenerativeModel _model;

  static void initialize() {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('GEMINI_API_KEY not found in environment variables');
    }
    
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
  }

  static Future<Map<String, dynamic>> analyzeProductImage(String imagePath) async {
    try {
      final imageFile = File(imagePath);
      final imageBytes = await imageFile.readAsBytes();
      
      const prompt = '''
Analyze this image and identify the product shown. Please provide a response in the following JSON format:
{
  "productName": "specific product name",
  "category": "product category (electronics, furniture, clothing, etc.)",
  "keywords": ["keyword1", "keyword2", "keyword3"],
  "description": "brief product description",
  "confidence": 0.95,
  "suggestions": ["similar search term 1", "similar search term 2"]
}

Focus on:
1. Identifying the main product in the image
2. Determining its category for shopping purposes
3. Extracting relevant keywords for product search
4. Providing a confidence score (0.0 to 1.0)
5. Suggesting alternative search terms

If multiple products are visible, focus on the most prominent one.
If the image is unclear or no product is identifiable, set confidence below 0.5 and indicate uncertainty.
''';

      final content = [
        Content.multi([
          TextPart(prompt),
          DataPart('image/jpeg', imageBytes),
        ])
      ];

      final response = await _model.generateContent(content);
      final responseText = response.text;

      if (responseText != null) {
        // Try to extract JSON from the response
        final jsonMatch = RegExp(r'\{.*\}', dotAll: true).firstMatch(responseText);
        if (jsonMatch != null) {
          final jsonString = jsonMatch.group(0)!;
          return _parseGeminiResponse(jsonString);
        }
      }

      // Fallback if JSON parsing fails
      return _createFallbackResponse(responseText ?? 'Unable to analyze image');
    } catch (e) {
      print('Gemini API Error: $e');
      return _createErrorResponse('Analysis failed: $e');
    }
  }

  static Map<String, dynamic> _parseGeminiResponse(String jsonString) {
    try {
      // Clean up the JSON string
      jsonString = jsonString.replaceAll('```json', '').replaceAll('```', '').trim();
      
      // For now, we'll create a mock response based on common patterns
      // In a real implementation, you'd use dart:convert to parse JSON
      return {
        'productName': _extractValue(jsonString, 'productName') ?? 'Unknown Product',
        'category': _extractValue(jsonString, 'category') ?? 'General',
        'keywords': _extractKeywords(jsonString),
        'description': _extractValue(jsonString, 'description') ?? 'Product detected in image',
        'confidence': 0.85,
        'suggestions': _extractSuggestions(jsonString),
      };
    } catch (e) {
      return _createFallbackResponse('Parsing error: $e');
    }
  }

  static String? _extractValue(String json, String key) {
    final pattern = RegExp('"$key"\\s*:\\s*"([^"]*)"');
    final match = pattern.firstMatch(json);
    return match?.group(1);
  }

  static List<String> _extractKeywords(String json) {
    final pattern = RegExp(r'"keywords"\s*:\s*\[(.*?)\]');
    final match = pattern.firstMatch(json);
    if (match != null) {
      final keywordsString = match.group(1)!;
      return keywordsString
          .split(',')
          .map((k) => k.replaceAll('"', '').trim())
          .where((k) => k.isNotEmpty)
          .toList();
    }
    return ['product', 'item'];
  }

  static List<String> _extractSuggestions(String json) {
    final pattern = RegExp(r'"suggestions"\s*:\s*\[(.*?)\]');
    final match = pattern.firstMatch(json);
    if (match != null) {
      final suggestionsString = match.group(1)!;
      return suggestionsString
          .split(',')
          .map((s) => s.replaceAll('"', '').trim())
          .where((s) => s.isNotEmpty)
          .toList();
    }
    return [];
  }

  static Map<String, dynamic> _createFallbackResponse(String message) {
    return {
      'productName': 'Unidentified Product',
      'category': 'General',
      'keywords': ['product', 'item'],
      'description': message,
      'confidence': 0.3,
      'suggestions': ['search manually'],
    };
  }

  static Map<String, dynamic> _createErrorResponse(String error) {
    return {
      'productName': 'Analysis Error',
      'category': 'General',
      'keywords': ['error'],
      'description': error,
      'confidence': 0.0,
      'suggestions': ['try again'],
    };
  }
}
