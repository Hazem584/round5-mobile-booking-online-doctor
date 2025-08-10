class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String hospital;
  final String image;
  final double rating;
  final String workingHours;
  bool isFavorite;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.image,
    required this.rating,
    required this.workingHours,
    this.isFavorite = false,
  });
}

class Hospital {
  final String id;
  final String name;
  final String address;
  final String image;
  final double rating;
  final String workingHours;
  bool isFavorite;

  Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
    required this.rating,
    required this.workingHours,
    this.isFavorite = false,
  });
}
