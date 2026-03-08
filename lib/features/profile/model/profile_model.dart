class ProfileModel {
  final String id;
  final String fullName;
  final String email;
  final String country;
  final String? profileImage;
  final String role;
  final String status;
  final bool isCompleteProfile;

  ProfileModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.country,
    this.profileImage,
    required this.role,
    required this.status,
    required this.isCompleteProfile,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      country: json['country'] ?? '',
      profileImage: json['profileImage'],
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      isCompleteProfile: json['isCompleteProfile'] ?? false,
    );
  }
}
