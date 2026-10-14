import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Layouts',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  final List<String> languages = const [
    'Dart',
    'JavaScript',
    'PHP',
    'C++',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        title: const Text(
          'Responsive Layouts',
          style: TextStyle(fontSize: 12),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: Colors.white38,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWideScreen = constraints.maxWidth >= 600;

            if (isWideScreen) {
              return Row(
                children: [
                  Expanded(
                    child: _buildWelcomePanel(),
                  ),
                  const VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: Colors.white38,
                  ),
                  Expanded(
                    child: _buildLanguageList(),
                  ),
                ],
              );
            }

            return Column(
              children: [
                _buildWelcomePanel(),
                Expanded(
                  child: _buildLanguageList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildWelcomePanel() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          const Text(
            'Cheetah Coding',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _buildButton('BUTTON 1'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildButton('BUTTON 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label) {
    return SizedBox(
      height: 38,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: const TextStyle(fontSize: 11),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: languages.length,
      itemBuilder: (context, index) {
        return Container(
          height: 54,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white38,
                width: 1,
              ),
            ),
          ),
          child: Text(
            languages[index],
            style: const TextStyle(fontSize: 14),
          ),
        );
      },
    );
  }
}