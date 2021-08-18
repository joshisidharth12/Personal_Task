import 'dart:convert';
import 'package:accucia_task/Model/Models.dart';
import 'package:http/http.dart' as http;

class WebServices {

  Future<Model> getdata() async {
    var url = Uri.parse("https://stark-spire-93433.herokuapp.com/json");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final Map jsonMap = jsonDecode(jsonString);
        var model = Model.fromJson(jsonMap);
        return model;
      } else {
        print("getting error");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
