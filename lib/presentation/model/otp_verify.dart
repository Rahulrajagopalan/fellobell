class OtpVerify {
  final bool status;
  final String message;

  OtpVerify({
    required this.status,
    required this.message,
  });

  factory OtpVerify.fromJson(Map<String, dynamic> json) {
    return OtpVerify(
      status: json['status'],
      message: json['message'],
    );
  }
}
