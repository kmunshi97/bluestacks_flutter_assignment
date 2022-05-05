// ignore_for_file: constant_identifier_names

class APIEndpoints {
  static const String BASE_URL =
      'http://tournaments-dot-game-tv-prod.uc.r.appspot.com';

  /// Tournament List Endpoint:
  /// URL: http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all
  /// Method: GET
  /// Queryparams:
  ///   -  limit=10
  ///   -  status=all
  ///   -  cursor=...
  ///
  static const String GET_TOURNAMENT_LIST_ENDOINT =
      BASE_URL + '/tournament/api/tournaments_list_v2';
}
