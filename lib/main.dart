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
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Book List'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Book(
              'The Lord of the Rings',
              'Alim Bin Yeasin',
              '4.5',
              Icons.shopping_cart,
              'https://m.media-amazon.com/images/I/71jLBXtWJWL._AC_UF1000,1000_QL80_.jpg',
              'The Lord of the Rings is an epic high fantasy novel by the English author and scholar J. R. R. Tolkien. Set in Middle-earth, the story began as a sequel to Tolkiens 1937 childrens book The Hobbit, but eventually developed into a much larger work.',
              '20.50'),
          SizedBox(height: 16.0),
          Book(
              'The Alchemist',
              'Paulo Coelho',
              '3.8',
              Icons.shopping_cart,
              'https://dailyasianage.com/library/1661800353_6.jpg',
              'The Alchemist is a novel by Brazilian author Paulo Coelho which was first published in 1988. Originally written in Portuguese, it became a widely translated international bestseller.',
              '9.99'),
          SizedBox(height: 16.0),
          Book(
              'Giggling Grammar',
              'Fatema Kamal',
              '5.0',
              Icons.shopping_cart,
              'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1566425108l/33.jpg',
              'Its Shel Silverstein meets Strunk and White and the results are both hilarious and instructive. With over 120 illustrations and gobs of delightfully goofy examples and exercises,  book provides a lighthearted and ludicrous guide to the essential elements of language and grammar...not to mention a few writing tips thrown into the mix.',
              '19.99'),
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
  final String imageUrl;
  final String description;
  final String price;
  Book(this.bookName, this.authorName, this.bookRating, this.icon,
      this.imageUrl, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              imageUrl,
              width: 50,
              height: 250,
              fit: BoxFit.fill,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(bookName, authorName,
                          bookRating, imageUrl, description, price),
                    ),
                  );
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

class SecondPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String bookRating;
  final String imageUrl;
  final String description;
  final String price;
  SecondPage(this.bookName, this.authorName, this.bookRating, this.imageUrl,
      this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Buy Now'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name: $bookName'),
            SizedBox(height: 16.0),
            Image.network(
              imageUrl,
              width: 250,
              height: 200,
            ),
            SizedBox(height: 16.0),
            Text('Author: $authorName'),
            SizedBox(height: 10),
            Text('Description: $description'),
            SizedBox(height: 10),
            Text('Price: $price'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    items: <String>['Cash', 'Mobile Banking', 'Card']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                    },
                    hint: Text('Payment'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shadowColor: Colors.blue),
                onPressed: () {
                  Navigator.pop(context); // Go back to the first page
                },
                child: Text('Go Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
