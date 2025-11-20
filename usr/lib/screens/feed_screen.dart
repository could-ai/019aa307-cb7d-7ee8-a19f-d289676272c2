import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulating a vertical feed of videos/images
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            // Background Content (Placeholder for Video/Image)
            Container(
              color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
              child: Center(
                child: Icon(
                  index % 2 == 0 ? Icons.videocam : Icons.image,
                  size: 100,
                  color: Colors.white24,
                ),
              ),
            ),
            
            // Overlay Gradient
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                  stops: [0.6, 1.0],
                ),
              ),
            ),

            // Right Side Action Buttons
            Positioned(
              right: 10,
              bottom: 100,
              child: Column(
                children: [
                  _buildActionButton(Icons.favorite, "1.2M"),
                  const SizedBox(height: 20),
                  _buildActionButton(Icons.comment, "4056"),
                  const SizedBox(height: 20),
                  _buildActionButton(Icons.share, "Share"),
                  const SizedBox(height: 20),
                  _buildMusicDisc(),
                ],
              ),
            ),

            // Bottom Info
            Positioned(
              left: 10,
              bottom: 20,
              right: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "@creator_${index + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Check out this amazing effect! #creative #flutter #design",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.music_note, size: 15, color: Colors.white),
                      SizedBox(width: 5),
                      Text("Original Sound - Creative Artist", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 35, color: Colors.white),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildMusicDisc() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[800],
        border: Border.all(color: Colors.grey[600]!, width: 8),
      ),
      child: const Center(
        child: CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage('https://picsum.photos/50'),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
