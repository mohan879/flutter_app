import 'package:flutter/material.dart';

/// Screen widget - can use more widgets (threshold: 20)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              subtitle: Text('View your profile'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              subtitle: Text('Your saved items'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              subtitle: Text('Recent activity'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Quick Actions', style: TextStyle(fontSize: 18)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('New'),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.share),
                label: const Text('Share'),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Export'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
