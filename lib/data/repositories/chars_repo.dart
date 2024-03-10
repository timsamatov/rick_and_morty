
import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/models/character_model.dart';

class CharsRepo{

  final Dio dio;
  CharsRepo({required this.dio});


  Future<CharacterModel> getData({String? name}) async{
    final Response response  = await dio.get(
      'character/',
      queryParameters: {
        "name": name 
      });

    return CharacterModel.fromJson(response.data);
  }
}