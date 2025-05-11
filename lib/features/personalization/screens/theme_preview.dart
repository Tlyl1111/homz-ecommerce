import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';

class ThemePreviewScreen extends StatefulWidget {
  const ThemePreviewScreen({super.key});

  @override
  State<ThemePreviewScreen> createState() => _ThemePreviewScreenState();
}

class _ThemePreviewScreenState extends State<ThemePreviewScreen> {
  bool isChecked = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: const Text('🎨 Theme Preview')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Text Styles
              const Text(
                'Text Styles',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Headline Large',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Body Medium',
                style: Theme.of(context).textTheme.title28Regular,
              ),
              const SizedBox(height: 16),

              /// Buttons
              const Text(
                '🔘 Buttons',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
              const SizedBox(height: 8),

              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),
              const SizedBox(height: 8),
              TextButton(onPressed: () {}, child: const Text('Text Button')),

              const Divider(height: 32),

              /// Input Field
              const Text(
                '📝 Text Field',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nhập mật khẩu', // Placeholder
                  labelText: 'Mật khẩu',
                ),
              ),

              const SizedBox(height: 24),

              /// Switch & Checkbox
              const Text(
                '🔄 Switch & Checkbox',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (val) => setState(() => isChecked = val!),
                  ),
                  const Text('Checkbox'),
                ],
              ),
              Row(
                children: [
                  Switch(
                    value: isSwitched,
                    onChanged: (val) => setState(() => isSwitched = val),
                  ),
                  const Text('Switch'),
                ],
              ),

              const SizedBox(height: 24),

              /// Chip
              const Text(
                '🏷 Chip Tags',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: const [
                  Chip(label: Text('Tag 1')),
                  Chip(label: Text('Tag 2')),
                  Chip(label: Text('Tag 3')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
