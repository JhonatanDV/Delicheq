
import 'package:flutter/material.dart';
import 'select_location_screen.dart';
import '../models/restaurant.dart';

class AddRestaurantScreen extends StatefulWidget {
  final Function(Restaurant) onRestaurantAdded;

  const AddRestaurantScreen({super.key, required this.onRestaurantAdded});

  @override
  State<AddRestaurantScreen> createState() => _AddRestaurantScreenState();
}

class _AddRestaurantScreenState extends State<AddRestaurantScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Restaurante'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del Restaurante',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre no puede estar vacío';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La descripción no puede estar vacía';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'URL de la Imagen',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La URL de la imagen no puede estar vacía';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectLocationScreen(
                        onLocationSelected: (lat, lng) {
                          setState(() {
                            latitude = lat;
                            longitude = lng;
                          });
                        },
                      ),
                    ),
                  );
                },
                child: Text(latitude == null || longitude == null
                    ? 'Seleccionar Ubicación'
                    : 'Ubicación Seleccionada: ($latitude, $longitude)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final restaurant = Restaurant(
                      name: _nameController.text,
                      description: _descriptionController.text,
                      imageUrl: _imageUrlController.text,
                      latitude: latitude,
                      longitude: longitude,
                    );
                    widget.onRestaurantAdded(restaurant);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Agregar Restaurante'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
