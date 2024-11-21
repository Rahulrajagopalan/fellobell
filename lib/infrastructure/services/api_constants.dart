class ApiConstants {
  static String baseUrl = 'http://13.202.27.112/api/v1';
  static String accessToken ='Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzA4OTM4OTQsImlhdCI6MTcyODMwMTg5NH0.ORhgYo1GmM3vn-m6hp3MpdXobNahasVCN0dQ_eiE5sI';
  static Map<String, dynamic> headers = {
    'X-Auth-Client': 12345,
    'X-Auth-Token': 12345,
    'Content-Type': 'application/json',
    'Authorization': accessToken,
  };
}
