import 'package:flutter/material.dart';

class CreateContentScreen extends StatefulWidget {
  const CreateContentScreen({super.key});

  @override
  State<CreateContentScreen> createState() => _CreateContentScreenState();
}

class _CreateContentScreenState extends State<CreateContentScreen> {
  String _selectedFilter = "Normal";
  Color _filterColor = Colors.transparent;

  final List<Map<String, dynamic>> _filters = [
    {"name": "Normal", "color": Colors.transparent},
    {"name": "Vintage", "color": Colors.orange.withOpacity(0.3)},
    {"name": "Cool", "color": Colors.blue.withOpacity(0.3)},
    {"name": "B&W", "color": Colors.grey.withOpacity(0.8)},
    {"name": "Sepia", "color": Colors.brown.withOpacity(0.4)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera Preview Placeholder
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Center(
                  child: Icon(Icons.camera_alt, size: 80, color: Colors.white24),
                ),
                // Filter Overlay
                Container(color: _filterColor),
              ],
            ),
          ),

          // Top Controls
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Add Music 🎵",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Right Side Tools
          Positioned(
            top: 60,
            right: 16,
            child: Column(
              children: [
                _buildToolIcon(Icons.flip_camera_ios, "Flip"),
                _buildToolIcon(Icons.speed, "Speed"),
                _buildToolIcon(Icons.face, "Effects"),
                _buildToolIcon(Icons.timer, "Timer"),
                _buildToolIcon(Icons.flash_on, "Flash"),
              ],
            ),
          ),

          // Bottom Controls
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Filter Selector
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _filters.length,
                    itemBuilder: (context, index) {
                      final filter = _filters[index];
                      final isSelected = _selectedFilter == filter['name'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedFilter = filter['name'];
                            _filterColor = filter['color'];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: isSelected ? Colors.pinkAccent : Colors.grey[800],
                                child: Text(
                                  filter['name'][0],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                filter['name'],
                                style: TextStyle(
                                  color: isSelected ? Colors.pinkAccent : Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 20),

                // Capture Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.photo_library, color: Colors.white),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        color: Colors.redAccent,
                      ),
                    ),
                    const Icon(Icons.backspace, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Hold to record, tap for photo", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolIcon(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}
