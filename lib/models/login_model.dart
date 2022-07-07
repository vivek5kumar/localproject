class UserLogin {
  int? status;
  ListData? listData;

  UserLogin({this.status, this.listData});

  UserLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    listData = json['list'] != null
        ? ListData.fromJson(json['list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    if (listData != null) {
      data['list'] = listData!.toJson();
    }
    return data;
  }
}

class ListData {
  String? id;
  String? name;
  String? username;
  String? email;
  String? password;
  String? usertype;
  String? block;
  String? sendEmail;
  String? registerDate;
  String? lastvisitDate;
  String? activation;
  String? params;
  String? lastResetTime;
  String? resetCount;
  String? joiningDate;
  String? empType;
  String? dob;
  String? confirmationDate;
  String? empid;
  String? empThumbid;
  String? noticePeriodInDays;
  String? resigned;
  String? exceptedTimePerDay;
  String? startTime;
  String? endTime;
  Null? profilePic;
  String? groupid;
  String? title;

  ListData(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.password,
      this.usertype,
      this.block,
      this.sendEmail,
      this.registerDate,
      this.lastvisitDate,
      this.activation,
      this.params,
      this.lastResetTime,
      this.resetCount,
      this.joiningDate,
      this.empType,
      this.dob,
      this.confirmationDate,
      this.empid,
      this.empThumbid,
      this.noticePeriodInDays,
      this.resigned,
      this.exceptedTimePerDay,
      this.startTime,
      this.endTime,
      this.profilePic,
      this.groupid,
      this.title});

  ListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    usertype = json['usertype'];
    block = json['block'];
    sendEmail = json['sendEmail'];
    registerDate = json['registerDate'];
    lastvisitDate = json['lastvisitDate'];
    activation = json['activation'];
    params = json['params'];
    lastResetTime = json['lastResetTime'];
    resetCount = json['resetCount'];
    joiningDate = json['joiningDate'];
    empType = json['emp_type'];
    dob = json['dob'];
    confirmationDate = json['confirmation_date'];
    empid = json['empid'];
    empThumbid = json['emp_thumbid'];
    noticePeriodInDays = json['notice_period_in_days'];
    resigned = json['resigned'];
    exceptedTimePerDay = json['excepted_time_per_day'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    profilePic = json['profile_pic'];
    groupid = json['groupid'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['usertype'] = usertype;
    data['block'] = block;
    data['sendEmail'] = sendEmail;
    data['registerDate'] = registerDate;
    data['lastvisitDate'] = lastvisitDate;
    data['activation'] = activation;
    data['params'] = params;
    data['lastResetTime'] = lastResetTime;
    data['resetCount'] = resetCount;
    data['joiningDate'] = joiningDate;
    data['emp_type'] = empType;
    data['dob'] = dob;
    data['confirmation_date'] = confirmationDate;
    data['empid'] = empid;
    data['emp_thumbid'] = empThumbid;
    data['notice_period_in_days'] = noticePeriodInDays;
    data['resigned'] = resigned;
    data['excepted_time_per_day'] = exceptedTimePerDay;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['profile_pic'] = profilePic;
    data['groupid'] = groupid;
    data['title'] = title;
    return data;
  }
}
