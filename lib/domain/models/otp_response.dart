class OtpResponse {
  final bool status;
  final String message;
  final int data;

  OtpResponse({
    required this.status,
    required this.message,
    required this.data,
  });


  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] as int,
    );
  }
}
