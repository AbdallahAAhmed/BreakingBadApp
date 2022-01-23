// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:movies/constants/endpoints.dart';

class CharactersWebServices 
{
  // take an object from Dio package to be more use flexible.
  late Dio dio;

  // Constractor
  CharactersWebServices()
  {
    // make the options  for dio to pass the baseUrl, and make the request more flexible.
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds
      receiveTimeout: 20 * 1000, 
    );

    // pass the options to main dio
    dio = Dio(options);
  }

  // function to get All Characters
  Future<List<dynamic>> getAllCharacters() async
  {
    try
    {
      Response response = await dio.get(allCharacters);
      // print(response.data.toString());
      return response.data;
    }catch(error)
    {
      print(error.toString());
      return [];
    }
  }


}