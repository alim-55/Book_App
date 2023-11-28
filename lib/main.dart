import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Book List'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Book('The Lord of the Rings', 'Alim Bin Yeasin', '4.5', Icons.book),
          SizedBox(height: 16.0),
          Book('The Alchemist', 'Paulo Coelho', '3.8', Icons.book),
        ],
      ),
    );
  }
}


class Book extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String bookRating;
  final IconData icon;

  Book(this.bookName, this.authorName, this.bookRating, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.book),
            ),
            title: Text(bookName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(authorName),
                Text('Rating: $bookRating'),
              ],
            ),
          ),
          ButtonBar(
            children: [
              ElevatedButton.icon(
                onPressed: () {

                },
                icon: Icon(icon),
                label: Text('Buy Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}