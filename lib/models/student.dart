class Student {
  final String firstname;
  final String lasrname;
  final String ncin;
  final String gender;
  final String email;
  final String password;
  final String departmentId;
  Student({required this.firstname, required this.lasrname, required this.ncin, required this.gender, required this.email, required this.password, required this.departmentId});


  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
     firstname: json['firstname'],
      lasrname: json['lasrname'],
      ncin:json['ncin'],
      gender: json['gender'],
      email: json['email'],
      password: json['password'],
      departmentId: json['departmentId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lasrname': lasrname,
        'ncin': ncin,
        'gender':gender,
        'email': email,
        'password': password,
        'departmentId': departmentId,
      };


}