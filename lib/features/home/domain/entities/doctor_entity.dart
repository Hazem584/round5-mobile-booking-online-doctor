class DoctorEntity {
  final int doctorProfileId;
  final String name;
  final String email;
  final String about;
  final String phone;
  final int specialtyId;
  final int experienceYears;
  final String specialtyNameEn;
  final String specialtyDescription;
  final String image;
  final String pricePerHour;
  final String location;
  final String rating;
  final String availableTime;
  final int userId;
  final String specialtyNameAr;
  final int hospitalId;
  final String hospitalName;
  final String hospitalStartTime;
  final String hospitalEndTime;
  final int availabilityId;
  final String day;
  final String startTime;
  final String endTime;
  bool isFav;

  DoctorEntity({
    required this.doctorProfileId,
    required this.email,
    required this.about,
    required this.phone,
    required this.specialtyId,
    required this.experienceYears,
    required this.specialtyNameEn,
    required this.specialtyDescription,
    required this.pricePerHour,
    required this.userId,
    required this.specialtyNameAr,
    required this.hospitalId,
    required this.hospitalName,
    required this.hospitalStartTime,
    required this.hospitalEndTime,
    required this.availabilityId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.name,
    required this.image,
    required this.location,
    required this.rating,
    required this.availableTime,
    this.isFav = false,
  });
}
