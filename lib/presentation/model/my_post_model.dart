class MyPostModel {
  final int id;
  final String jobId;
  final String name;
  final String userImage;
  final String jobCategory;
  final int noOfLabours;
  final String jobStartDate;
  final String jobEndDate;
  final String postDate;
  final String jobStartTime;
  final String jobEndTime;
  final String jobDescription;
  final List<JobDescTrans> jobDescTrans;
  final int landmarkId;
  final String landmark;
  final String userType;
  final String status;
  final int noOfRequest;
  final int acceptedRequestCount;
  final int unAcceptedRequestCount;

  MyPostModel({
    required this.id,
    required this.jobId,
    required this.name,
    required this.userImage,
    required this.jobCategory,
    required this.noOfLabours,
    required this.jobStartDate,
    required this.jobEndDate,
    required this.postDate,
    required this.jobStartTime,
    required this.jobEndTime,
    required this.jobDescription,
    required this.jobDescTrans,
    required this.landmarkId,
    required this.landmark,
    required this.userType,
    required this.status,
    required this.noOfRequest,
    required this.acceptedRequestCount,
    required this.unAcceptedRequestCount,
  });

  factory MyPostModel.fromJson(Map<String, dynamic> json) {
    return MyPostModel(
      id: json['id'],
      jobId: json['job_id'],
      name: json['name'],
      userImage: json['user_image'],
      jobCategory: json['job_category'],
      noOfLabours: json['No_of_labours'],
      jobStartDate: json['job_start_date'],
      jobEndDate: json['job_end_date'],
      postDate: json['post_date'],
      jobStartTime: json['job_start_time'],
      jobEndTime: json['job_end_time'],
      jobDescription: json['job_description'],
      jobDescTrans: (json['job_desc_trans'] as List)
          .map((e) => JobDescTrans.fromJson(e))
          .toList(),
      landmarkId: json['landmark_id'],
      landmark: json['landmark'],
      userType: json['user_type'],
      status: json['status'],
      noOfRequest: json['no_of_request'],
      acceptedRequestCount: json['accepted_request_count'],
      unAcceptedRequestCount: json['un_accepted_request_count'],
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
