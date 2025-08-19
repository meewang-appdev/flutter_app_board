import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListItem extends StatelessWidget {
  const ShimmerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목 Placeholder
              Container(width: double.infinity, height: 20.0, color: Colors.white),
              const SizedBox(height: 8),
              // 부제목 Placeholder
              Container(width: 150.0, height: 14.0, color: Colors.white),
              const SizedBox(height: 12),
              // 아이콘 Placeholder
              Row(
                children: [
                  Container(width: 50.0, height: 14.0, color: Colors.white),
                  const SizedBox(width: 16),
                  Container(width: 50.0, height: 14.0, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}