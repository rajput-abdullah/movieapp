/// status_code : 7
/// status_message : "Invalid API key: You must be granted a valid key."
/// success : false

class ErrorResponse {
  ErrorResponse({
      this.statusCode, 
      this.statusMessage, 
      this.success,});

  ErrorResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
  }
  int? statusCode;
  String? statusMessage;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    map['success'] = success;
    return map;
  }

}