class CarouselImageModel {
  final int id;
  final String name;
  final String imageUrl;

  CarouselImageModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory CarouselImageModel.fromJson(Map<String, dynamic> json) {
    return CarouselImageModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}

class ApiResponse {
  final bool status;
  final String message;
  final List<CarouselImageModel> data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => CarouselImageModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
