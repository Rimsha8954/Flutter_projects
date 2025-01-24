import 'dart:convert';
import 'package:covid_app/Model/WorldStatsModel.dart';
import 'package:http/http.dart' as http;
import 'Utitlities/app_url.dart';


class StatsServices{
  Future<WorldStatsModel> fetchWorldStatsRecords() async{
    
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      return WorldStatsModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async{

    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      return data;
    }else{
      throw Exception('Error');
    }
  }
}