class ApiConstants {
  static String baseUrl = 'http://13.202.27.112/api/v1';
  static String accessToken ='Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzQ4NDM1NTYsImlhdCI6MTczMjI1MTU1Nn0.YkVNiGQn4sfmFAyKb4WkOFHNaJE_wDtIqyEvBNq2Vvc';
  static Map<String, dynamic> headers = {
    'X-Auth-Client': 12345,
    'X-Auth-Token': 12345,
    'Content-Type': 'application/json',
    'Authorization': accessToken,
  };
}
