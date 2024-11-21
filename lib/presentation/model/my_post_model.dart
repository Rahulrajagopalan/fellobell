import 'dart:convert';

class MyPostModel {
    final int? id;
    final String? jobId;
    final String? name;
    final String? userImage;
    final String? jobCategory;
    final int? noOfLabours;
    final String? jobStartDate;
    final String? jobEndDate;
    final DateTime? postDate;
    final String? jobStartTime;
    final String? jobEndTime;
    final String? jobDescription;
    final List<JobDescTran>? jobDescTrans;
    final int? landmarkId;
    final Landmark? landmark;
    final String? userType;
    final Status? status;
    final int? noOfRequest;
    final int? acceptedRequestCount;
    final int? unAcceptedRequestCount;

    MyPostModel({
        this.id,
        this.jobId,
        this.name,
        this.userImage,
        this.jobCategory,
        this.noOfLabours,
        this.jobStartDate,
        this.jobEndDate,
        this.postDate,
        this.jobStartTime,
        this.jobEndTime,
        this.jobDescription,
        this.jobDescTrans,
        this.landmarkId,
        this.landmark,
        this.userType,
        this.status,
        this.noOfRequest,
        this.acceptedRequestCount,
        this.unAcceptedRequestCount,
    });

    factory MyPostModel.fromJson(String str) => MyPostModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MyPostModel.fromMap(Map<String, dynamic> json) => MyPostModel(
        id: json["id"],
        jobId: json["job_id"],
        name: json["name"],
        userImage: json["user_image"],
        jobCategory: json["job_category"],
        noOfLabours: json["No_of_labours"],
        jobStartDate: json["job_start_date"],
        jobEndDate: json["job_end_date"],
        postDate: json["post_date"] == null ? null : DateTime.parse(json["post_date"]),
        jobStartTime: json["job_start_time"],
        jobEndTime: json["job_end_time"],
        jobDescription: json["job_description"],
        jobDescTrans: json["job_desc_trans"] == null ? [] : List<JobDescTran>.from(json["job_desc_trans"]!.map((x) => JobDescTran.fromMap(x))),
        landmarkId: json["landmark_id"],
        landmark: landmarkValues.map[json["landmark"]]!,
        userType: json["user_type"],
        status: statusValues.map[json["status"]]!,
        noOfRequest: json["no_of_request"],
        acceptedRequestCount: json["accepted_request_count"],
        unAcceptedRequestCount: json["un_accepted_request_count"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "job_id": jobId,
        "name": name,
        "user_image": userImage,
        "job_category": jobCategory,
        "No_of_labours": noOfLabours,
        "job_start_date": jobStartDate,
        "job_end_date": jobEndDate,
        "post_date": "${postDate!.year.toString().padLeft(4, '0')}-${postDate!.month.toString().padLeft(2, '0')}-${postDate!.day.toString().padLeft(2, '0')}",
        "job_start_time": jobStartTime,
        "job_end_time": jobEndTime,
        "job_description": jobDescription,
        "job_desc_trans": jobDescTrans == null ? [] : List<dynamic>.from(jobDescTrans!.map((x) => x.toMap())),
        "landmark_id": landmarkId,
        "landmark": landmarkValues.reverse[landmark],
        "user_type": userType,
        "status": statusValues.reverse[status],
        "no_of_request": noOfRequest,
        "accepted_request_count": acceptedRequestCount,
        "un_accepted_request_count": unAcceptedRequestCount,
    };
}

class JobDescTran {
    final LanguageCode? languageCode;
    final String? languageText;

    JobDescTran({
        this.languageCode,
        this.languageText,
    });

    factory JobDescTran.fromJson(String str) => JobDescTran.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JobDescTran.fromMap(Map<String, dynamic> json) => JobDescTran(
        languageCode: languageCodeValues.map[json["language_code"]]!,
        languageText: json["language_text"],
    );

    Map<String, dynamic> toMap() => {
        "language_code": languageCodeValues.reverse[languageCode],
        "language_text": languageText,
    };
}

enum LanguageCode {
    BN,
    HI,
    ML,
    TA
}

final languageCodeValues = EnumValues({
    "bn": LanguageCode.BN,
    "hi": LanguageCode.HI,
    "ml": LanguageCode.ML,
    "ta": LanguageCode.TA
});

enum Landmark {
    KALAMASSERY
}

final landmarkValues = EnumValues({
    "Kalamassery": Landmark.KALAMASSERY
});

enum Status {
    COMPLETED,
    EXPIRED
}

final statusValues = EnumValues({
    "Completed": Status.COMPLETED,
    "Expired": Status.EXPIRED
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
