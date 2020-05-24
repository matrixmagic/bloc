class apiresponse {
  String error;
  bool success;
  String msg;
  String codeMsg;

  apiresponse({this.error, this.success, this.msg, this.codeMsg});

  apiresponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    msg = json['msg'];
    codeMsg = json['codeMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    data['msg'] = this.msg;
    data['codeMsg'] = this.codeMsg;
    return data;
  }
}
