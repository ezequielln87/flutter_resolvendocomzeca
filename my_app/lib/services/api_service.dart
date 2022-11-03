import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:my_app/constants.dart';
import 'package:my_app/model/cliente_model.dart';

class ApiService {
  Future<List<ClienteModel>?> getClientes() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.clientesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ClienteModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
