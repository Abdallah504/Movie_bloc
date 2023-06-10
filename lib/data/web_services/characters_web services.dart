import 'package:dio/dio.dart';
import 'package:movie_bloc/constants/strings.dart';

class CharactersWebServices{
  late Dio dio;
  CharactersWebServices(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrlApi,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(minutes: 1),
      receiveTimeout: Duration(minutes: 1),


    );
    dio = Dio(options);
    
  }
  Future <List<dynamic>>getAllCharacters() async{
      try{
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data;
      } catch(e){
        print(e.toString());
        return [];
      }
    }
}