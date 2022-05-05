import 'package:bluestacks_assignment/logic/helpers/dio_helper.dart';
import 'package:bluestacks_assignment/logic/models/tournament_list_model/tournament_list_model.dart.dart';
import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';

class TournamentListRepository {
  Logger logger = Logger();

  Future<TournamentListModel?> getTournamentListData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response _response = await DIOHelper().getAPIData(
        endpoint: APIEndpoints.GET_TOURNAMENT_LIST_ENDOINT,
        queryparams: queryparams,
      );

      if (_response.statusCode == 200) {
        return TournamentListModel.fromJson(_response.data);
      }

      return null;
    } catch (_err, _stacktrace) {
      logger.i("Unable to parse the response json to TournamentListModel.");
      logger.e(_err);
      logger.e(_stacktrace);
      return Future.error("An error occurred, please try again later.");
    }
  }
}
