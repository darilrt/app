import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> usersList = [
      'Daril Rodriguez',
      'Nachitou Lokitou',
    ];

    final List<String> messagesList = [
      'Hello',
      'Hi',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (BuildContext context, int index) {
          String name = usersList[index];
          String message = messagesList[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(5), // Border radius
                  child: ClipOval(
                    child: Image.network(
                      'https://ui-avatars.com/api/?name=$name',
                    ),
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
