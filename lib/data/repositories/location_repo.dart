import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/models/locations_model.dart';

class LocationRepo{

  final Dio dio;
  LocationRepo({required this.dio});


  Future<LocationsModel> getData({String? name}) async{
    final Response response  = await dio.get(
      'location/',
      queryParameters: {
        "name": name 
      });

    return LocationsModel.fromJson(response.data);
  }
}