import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; //location name for the UI
  String time=''; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({
    required this.location,
    required this.flag,
    required this.url
  });

  Future<void> getTime() async{
    Response response = await get('http://worldtimeapi.org/api/timezone/$url' as Uri);
    Map data = jsonDecode(response.body);
    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);

    //create a datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();
  }


}