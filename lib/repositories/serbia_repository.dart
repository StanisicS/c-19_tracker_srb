import 'package:google_maps_int/api/api_base_helper.dart';
import 'package:google_maps_int/models/serbia.dart';

class SerbiaRepository {
  final String _apiKey = "Paste your api key here";

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Serbia>> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return response;
  }
}
