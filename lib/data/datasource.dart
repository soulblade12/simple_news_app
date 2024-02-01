import 'package:http/http.dart' as http;
import 'dart:core';

class GetData{
  Future<String> GetNewsData() async {
    var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=keyword&apiKey=4b397c0b925c48649a61b00c6ab69622"));
    if (response.statusCode == 200) {
      print(response.body);
      return(response.body);
    }else{
      throw Exception('Data Gagal untuk Diambil');
    }
  }
}

