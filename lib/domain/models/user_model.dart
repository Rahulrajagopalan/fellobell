class UserModel {
  final String name;
  final int userId;
  final String userImage;
  final String mobileNo;
  final String alternatePhone;
  final String email;
  final String state;
  final int stateId;
  final String district;
  final int districtId;
  final String landmark;
  final int landmarkId;
  final String dob;
  final int gender;
  final String languageKey;
  final String language;
  final String businessName;
  final String description;
  final String address;
  final int userType;
  final double userPoints;
  final bool isSubscribed;
  final int planId;
  final String planName;
  final String userIdProofFileUrl;
  final String userIdProofFileName;
  final String userSkillCertificateUrl;
  final String userSkillCertificateFileName;
  final List<String> userSkills;
  final List<int> completedJobCount;
  final double rating;
  final List<String> feedbacks;

  UserModel({
    required this.name,
    required this.userId,
    required this.userImage,
    required this.mobileNo,
    required this.alternatePhone,
    required this.email,
    required this.state,
    required this.stateId,
    required this.district,
    required this.districtId,
    required this.landmark,
    required this.landmarkId,
    required this.dob,
    required this.gender,
    required this.languageKey,
    required this.language,
    required this.businessName,
    required this.description,
    required this.address,
    required this.userType,
    required this.userPoints,
    required this.isSubscribed,
    required this.planId,
    required this.planName,
    required this.userIdProofFileUrl,
    required this.userIdProofFileName,
    required this.userSkillCertificateUrl,
    required this.userSkillCertificateFileName,
    required this.userSkills,
    required this.completedJobCount,
    required this.rating,
    required this.feedbacks,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      userId: json['user_id'] as int,
      userImage: json['user_image'] as String,
      mobileNo: json['mobile_no'] as String,
      alternatePhone: json['alternate_phone'] as String,
      email: json['email'] as String,
      state: json['state'] as String,
      stateId: json['state_id'] as int,
      district: json['district'] as String,
      districtId: json['district_id'] as int,
      landmark: json['landmark'] as String,
      landmarkId: json['landmark_id'] as int,
      dob: json['dob'] as String,
      gender: json['gender'] as int,
      languageKey: json['language_key'] as String,
      language: json['language'] as String,
      businessName: json['business_name'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
      userType: json['user_type'] as int,
      userPoints: (json['user_points'] as num).toDouble(),
      isSubscribed: json['is_subscribed'] as bool,
      planId: json['plan_id'] as int,
      planName: json['plan_name'] as String,
      userIdProofFileUrl: json['user_id_proof_file_url'] as String,
      userIdProofFileName: json['user_id_proof_file_name'] as String,
      userSkillCertificateUrl: json['user_skill_certificate_url'] as String,
      userSkillCertificateFileName: json['user_skill_certificate_file_name'] as String,
      userSkills: List<String>.from(json['user_skills']),
      completedJobCount: List<int>.from(json['completed_job_count']),
      rating: (json['rating'] as num).toDouble(),
      feedbacks: List<String>.from(json['feedbacks']),
    );
  }
}
