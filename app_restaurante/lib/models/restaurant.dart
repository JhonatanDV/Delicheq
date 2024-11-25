class Restaurant {
  final String name;
  final String description;
  final String imageUrl;
  final double? latitude; // Marcado como anulable
  final double? longitude; // Marcado como anulable
  final List<Review> reviews;

  Restaurant({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.latitude, // Puede ser null si no se proporciona
    this.longitude, // Puede ser null si no se proporciona
    this.reviews = const [],
  });
}

class Review {
  final String userName;
  final double rating;
  final String comment;

  Review({
    required this.userName,
    required this.rating,
    required this.comment,
  });
}

