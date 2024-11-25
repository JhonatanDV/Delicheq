import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'restaurant_list_screen.dart'; // Importar la pantalla de reseñas de restaurantes

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/21/5f/e3/piazza-italia-by-storia.jpg?w=600&h=-1&s=1',
      'https://cloudfront-us-east-1.images.arcpublishing.com/elespectador/2K7FHLJP75FGRO2LKQMCFKFKWA.jpg',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/58/c4/7c/el-equipo-de-9-patrias.jpg?w=600&h=-1&s=1',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reseñas de Restaurantes'),
        backgroundColor: Colors.green[900], // Color igual al de la imagen
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrar contenido verticalmente
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '¡Descubre los mejores restaurantes!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Encuentra los mejores lugares para disfrutar una experiencia culinaria única. Comparte tus reseñas con nuestra comunidad.',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: imageUrls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
      backgroundColor: Colors.green[900], // Color igual al de la imagen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[800], // Color similar al fondo
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurantes',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RestaurantListScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
