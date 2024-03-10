import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/models/episode_model.dart';

class EpisodeRepo{

  final Dio dio;
  EpisodeRepo({required this.dio});


  Future<EpisodeModel> getData({String? name}) async{
    final Response response  = await dio.get(
      'episode/',
      queryParameters: {
        "name": name 
      });

    return EpisodeModel.fromJson(response.data);
  }
}