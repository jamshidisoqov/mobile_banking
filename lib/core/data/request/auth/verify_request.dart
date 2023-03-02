class VerifyRequest {
  String? token;
  String? code;

  VerifyRequest({this.token, this.code});

  VerifyRequest.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['code'] = code;
    return data;
  }
}
