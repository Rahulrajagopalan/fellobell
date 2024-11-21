class PostModel {
  final bool status;
  final String message;
  final List<dynamic> data;

  PostModel({required this.status, required this.message, required this.data});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] as List<dynamic>,
    );
  }
}
