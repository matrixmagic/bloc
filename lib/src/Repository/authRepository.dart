import 'dart:convert';

import 'package:hishamoo2/src/model/apiresponse.dart';
import 'package:hishamoo2/src/model/loginDTO.dart';
import 'package:hishamoo2/src/network/apiprovider.dart';

class authRepository {
  ApiProvider api = new ApiProvider();
  Future<bool> login(String username, String password) async {
    loginDTO log = new loginDTO();
    log.email = username;
    log.password = password;
    var res = await api.post('auth/login', log.toJson());
    var d = apiresponse.fromJson(json.decode(res.body));
    print(d);
    if (d.success == true)
      return true;
    else
      return false;
  }
}
