class userprofile {
  String? sId;
  String? username;
  String? email;
  String? gender;  
  String? password;
  int? iV;
  String? address;

  userprofile(
      {this.sId,
      this.username,
      this.email,
      this.gender,
      this.password,
      this.iV,
      this.address});

  userprofile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    gender = json['gender'];
    password = json['password'];
    iV = json['__v'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['password'] = this.password;
    data['__v'] = this.iV;
    data['address'] = this.address;
    return data;
  }
}