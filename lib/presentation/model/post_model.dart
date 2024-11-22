class PostModel {
  final double distanceMeters;
  final int id;
  final String jobId;
  final String name;
  final String createdUserName;
  final String jobStartDate;
  final String jobEndDate;
  final String jobDescription;
  final List<JobDescTrans> jobDescTrans;
  final int landmarkId;
  final String landmark;
  final String jobCategory;
  final String jobStartTime;
  final String jobEndTime;
  final int noOfLabours;
  final String postDate;
  final String userImage;
  final bool isApplied;
  final bool isApproved;
  final String userType;
  final String postStatus;
  final String jobStatus;

  PostModel({
    required this.distanceMeters,
    required this.id,
    required this.jobId,
    required this.name,
    required this.createdUserName,
    required this.jobStartDate,
    required this.jobEndDate,
    required this.jobDescription,
    required this.jobDescTrans,
    required this.landmarkId,
    required this.landmark,
    required this.jobCategory,
    required this.jobStartTime,
    required this.jobEndTime,
    required this.noOfLabours,
    required this.postDate,
    required this.userImage,
    required this.isApplied,
    required this.isApproved,
    required this.userType,
    required this.postStatus,
    required this.jobStatus,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      distanceMeters: json['distance_meters'],
      id: json['id'],
      jobId: json['job_id'],
      name: json['name'],
      createdUserName: json['created_user_name'],
      jobStartDate: json['job_start_date'],
      jobEndDate: json['job_end_date'],
      jobDescription: json['job_description'],
      jobDescTrans: (json['job_desc_trans'] as List)
          .map((e) => JobDescTrans.fromJson(e))
          .toList(),
      landmarkId: json['landmark_id'],
      landmark: json['landmark'],
      jobCategory: json['job_category'],
      jobStartTime: json['job_start_time'],
      jobEndTime: json['job_end_time'],
      noOfLabours: json['No_of_labours'],
      postDate: json['post_date'],
      userImage: json['user_image'],
      isApplied: json['is_applied'],
      isApproved: json['is_approved'],
      userType: json['user_type'],
      postStatus: json['post_status'],
      jobStatus: json['job_status'],
    );
  }
}

class JobDescTrans {
  final String languageCode;
  final String languageText;

  JobDescTrans({
    required this.languageCode,
    required this.languageText,
  });

  factory JobDescTrans.fromJson(Map<String, dynamic> json) {
    return JobDescTrans(
      languageCode: json['language_code'],
      languageText: json['language_text'],
    );
  }
}
