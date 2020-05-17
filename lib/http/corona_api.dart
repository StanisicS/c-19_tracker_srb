import 'dart:async';
import 'dart:convert';
import 'dart:io' show HttpStatus;

import 'package:corovavirusapp/dto/countries_info_dto.dart';
import 'package:corovavirusapp/dto/global_info_dto.dart';
import 'package:corovavirusapp/dto/timeline/country_info_timeline_dto.dart';
import 'package:corovavirusapp/dto/usa/usa_state_info.dart';
import 'package:corovavirusapp/http/api_config.dart';
import 'package:corovavirusapp/repository/corona_bloc.dart';
import 'package:corovavirusapp/util/logging.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CoronaApi {
  Future<Global> getGlobal() async {
    try {
      final Uri uri = Uri.https(heroku_2_base_url, 'v2/all');
      final Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        return Global.fromJsonMap(
          json.decode(response.body) as Map<String, dynamic>,
        );
      }
      CoronaBloc().globalBehaviorSubject$.addError(response.statusCode);
    } catch (e, s) {
      logger.severe("error while calling getGlobal api", e, s);
      CoronaBloc().globalBehaviorSubject$.addError(e, s);
    }
    return null;
  }

  Future<List<Serbia>> getSerbia() async {
    try {
      final Uri uri = Uri.https(
        heroku_2_base_url,
        'v2/countries/Serbia?yesterday=true&allowNull=true',
      );
      final Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        return (json.decode(response.body) as List<dynamic>)
            .map((dynamic res) =>
                SerbiaModel.fromJsonMap(res as Map<String, dynamic>))
            .toList();
      }
      CoronaBloc().serbiaBehaviorSubject$.addError(response.statusCode);
    } catch (e, s) {
      logger.severe("error while calling getSerbia api", e, s);
      CoronaBloc().serbiaBehaviorSubject$.addError(e, s);
    }
    return null;
  }

  Future<SerbiaTimeline> getSerbiaTimeline() async {
    try {
      final Uri uri = Uri.https(
        heroku_2_base_url,
        'v2/historical/Serbia',
      );
      final Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        return SerbiaTimeline.fromJsonMap(
          json.decode(response.body) as Map<String, dynamic>,
        );
      }
      CoronaBloc().serbiaTimelineBehaviorSubject$.addError(response.statusCode);
    } catch (e, s) {
      logger.severe("error while calling SerbiaTimeline api", e, s);
      CoronaBloc().serbiaTimelineBehaviorSubject$.addError(e, s);
    }
    return null;
  }
}