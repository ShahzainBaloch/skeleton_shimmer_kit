import 'package:flutter/material.dart';
import 'package:skeleton_shimmer_kit/skeleton_shimmer_kit.dart';

void main() {
  runApp(const SkeletonExampleApp());
}

class SkeletonExampleApp extends StatelessWidget {
  const SkeletonExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skeleton Shimmer Kit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const SkeletonDemoScreen(),
    );
  }
}

class SkeletonDemoScreen extends StatefulWidget {
  const SkeletonDemoScreen({super.key});

  @override
  State<SkeletonDemoScreen> createState() => _SkeletonDemoScreenState();
}

class _SkeletonDemoScreenState extends State<SkeletonDemoScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Skeleton Shimmer Kit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              Text(
                _isLoading ? 'Loading' : 'Loaded',
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Switch(
                value: _isLoading,
                onChanged: (val) => setState(() => _isLoading = val),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _isLoading ? _buildSkeletonFeed() : _buildLoadedContent(),
    );
  }

  Widget _buildSkeletonFeed() {
    return SkeletonShimmer(
      duration: const Duration(milliseconds: 1300),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          // Profile header skeleton
          SkeletonListTile(leadingSize: 52),
          SizedBox(height: 16),

          // Paragraph skeleton
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SkeletonParagraph(lines: 3),
          ),
          SizedBox(height: 24),

          // Post card skeleton
          SkeletonCard(imageHeight: 190),
          SizedBox(height: 20),

          // Second post card
          SkeletonCard(imageHeight: 150),
        ],
      ),
    );
  }

  Widget _buildLoadedContent() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: const CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
            ),
          ),
          title: const Text(
            'Sophia Martinez',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('Design Engineer @ Acme Corp'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Just released our new Impeller design system in Flutter! The performance on 120Hz displays is mindblowing.',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1579783902614-a3fb3927b675?w=800',
                height: 190,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Modern UI Architecture in 2026',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
