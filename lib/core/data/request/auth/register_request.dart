class RegisterRequest {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;

  RegisterRequest(
      {this.firstName, this.lastName, this.phoneNumber, this.password});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}