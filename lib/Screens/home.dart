import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          CustomItem(imageUrl: 'https://images.unsplash.com/photo-1583258292688-d0213dc5a3a8?crop=entropy&cs=srgb&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMnx8bWFya2v0fGVufDB8fHx8MTY5NTI4ODU1MXww&ixlib=rb-4.0.3&q=85', title: 'SUPERMERCADO'),
          CustomItem(imageUrl: 'https://images.unsplash.com/photo-1583258292688-d0213dc5a3a8?crop=entropy&cs=srgb&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMnx8bWFya2v0fGVufDB8fHx8MTY5NTI4ODU1MXww&ixlib=rb-4.0.3&q=85', title: 'FARMACIA'),
          CustomItem(imageUrl: 'https://via.placeholder.com/300x200', title: 'Imagen 3'),
        ],
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  CustomItem({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(imageUrl: imageUrl, title: title),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 8.0, 8.0), // Agregar padding izquierdo y superior
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center( // Centrar la imagen
            child: Container(
              width: 350, // Ancho de 300 px
              height: 200, // Alto de 200 px
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Radio de borde de 8
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Aplicar borderRadius a la imagen
                child: Image.network(
                  imageUrl,
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;

  DetailScreen({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 8.0, 8.0), // Agregar padding izquierdo y superior
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center( // Centrar la imagen
            child: Container(
              width: 400, // Ancho de 300 px
              height: 200, // Alto de 200 px
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Radio de borde de 8
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Aplicar borderRadius a la imagen
                child: Image.network(
                  imageUrl,
                  width: 450,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
