import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Carousel
            SizedBox(
              height: 150,
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Trending Event #${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Trending Now",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Trending Hashtags
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _HashtagChip(label: "#flutter"),
                  _HashtagChip(label: "#dance"),
                  _HashtagChip(label: "#comedy"),
                  _HashtagChip(label: "#music"),
                  _HashtagChip(label: "#art"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Grid of content
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[900],
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Placeholder image
                      Container(
                        color: Colors.blueGrey[(index * 100) % 900],
                        child: const Icon(Icons.play_circle_outline, color: Colors.white54, size: 40),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Text(
                          "Video ${index + 1}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HashtagChip extends StatelessWidget {
  final String label;
  const _HashtagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[700]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
