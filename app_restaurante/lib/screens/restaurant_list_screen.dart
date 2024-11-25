import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import 'add_review_screen.dart';
import 'add_restaurant_screen.dart';
import 'restaurant_details_screen.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Piazza Italia',
      description: 'Auténtica comida italiana en el corazón de la ciudad.',
      imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/21/5f/e3/piazza-italia-by-storia.jpg',
      reviews: [
        Review(userName: 'Juan', rating: 4.5, comment: 'Excelente comida y servicio.'),
        Review(userName: 'Ana', rating: 4.0, comment: 'Ambiente agradable y buena comida.'),
      ],
    ),
    Restaurant(
      name: 'Asadero Gourmet',
      description: 'El mejor asado al estilo gourmet.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSNmV6aFVx7pLcwA0q4KpG8PVbkpLHeJYsuw&s',
      reviews: [],
    ),
  ];

  void _addRestaurant(Restaurant restaurant) {
    setState(() {
      restaurants.add(restaurant);
    });
  }

  void _addReview(int index, Review review) {
    setState(() {
      restaurants[index].reviews.add(review);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reseñas de Restaurantes'),
        backgroundColor: Colors.green[800],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRestaurantScreen(
                onRestaurantAdded: _addRestaurant,
              ),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    restaurant.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        restaurant.description,
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                if (restaurant.reviews.isNotEmpty) ...[
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: restaurant.reviews.map((review) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow[700], size: 18),
                                Text(
                                  ' ${review.rating.toString()}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              review.comment,
                              style: const TextStyle(color: Colors.black87),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddReviewScreen(
                                onReviewAdded: (review) => _addReview(index, review),
                              ),
                            ),
                          );
                        },
                        child: const Text('Agregar Reseña'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantDetailsScreen(restaurant: restaurant),
                            ),
                          );
                        },
                        child: const Text('Más Información'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
