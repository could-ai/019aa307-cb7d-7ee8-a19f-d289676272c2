import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[800],
              backgroundImage: const NetworkImage('https://picsum.photos/100'),
            ),
            title: Text(
              "User ${index + 1}",
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              index % 2 == 0 
                  ? "started following you." 
                  : "liked your video.",
              style: TextStyle(color: Colors.grey[400]),
            ),
            trailing: index % 2 == 0
                ? ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: const Text("Follow Back", style: TextStyle(fontSize: 12, color: Colors.white)),
                  )
                : Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[800],
                    child: const Icon(Icons.play_arrow, size: 16, color: Colors.white),
                  ),
          );
        },
      ),
    );
  }
}
