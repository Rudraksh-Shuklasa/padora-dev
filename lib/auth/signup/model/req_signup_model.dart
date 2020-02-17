class ReqSignupModel{
  String first_name;
  String last_name;
  String email;
  String mobile_no;
  String password;


  ReqSignupModel({this.first_name, this.last_name,this.email,this.mobile_no,this.password});

  ReqSignupModel.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    mobile_no = json['mobile_no'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobile_no;
    data['password'] = this.password;

    return data;
  }
}

