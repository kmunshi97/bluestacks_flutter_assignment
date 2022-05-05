// ignore_for_file: constant_identifier_names

// To parse this JSON data, do
//
//     final tournamentListModel = tournamentListModelFromJson(jsonString);

import 'dart:convert';

TournamentListModel tournamentListModelFromJson(String str) =>
    TournamentListModel.fromJson(json.decode(str));

String tournamentListModelToJson(TournamentListModel data) =>
    json.encode(data.toJson());

class TournamentListModel {
  TournamentListModel({
    this.code,
    this.data,
    this.success = false,
  });

  final int? code;
  final Data? data;
  final bool? success;

  factory TournamentListModel.fromJson(Map<String, dynamic> json) =>
      TournamentListModel(
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "success": success,
      };
}

class Data {
  Data({
    this.cursor,
    this.tournamentCount,
    this.tournaments = const <Tournament>[],
    this.isLastBatch,
  });

  final String? cursor;
  final dynamic tournamentCount;
  final List<Tournament?> tournaments;
  final bool? isLastBatch;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cursor: json["cursor"],
        tournamentCount: json["tournament_count"],
        tournaments: List<Tournament>.from(
          json["tournaments"].map(
            (x) => Tournament.fromJson(x),
          ),
        ),
        isLastBatch: json["is_last_batch"],
      );

  Map<String, dynamic> toJson() => {
        "cursor": cursor,
        "tournament_count": tournamentCount,
        "tournaments": List<dynamic>.from(
          tournaments.map(
            (x) => x?.toJson(),
          ),
        ),
        "is_last_batch": isLastBatch,
      };
}

class Tournament {
  Tournament({
    this.isCheckInRequired,
    this.tournamentId,
    this.tournamentEnded,
    this.tournamentEndDate,
    this.areRandomTeamsAllowed,
    this.registeredTeams,
    this.adminLocale,
    this.regEndDate,
    this.startDate,
    this.rules,
    this.maxTeams,
    this.tournamentUrl,
    this.prizes,
    this.matchStyleType,
    this.pwaUrl,
    this.tournamentType,
    this.geo,
    this.maxLevelId,
    this.isPasswordRequired,
    this.name,
    this.matchStyle,
    this.registrationUrl,
    this.gamePkg,
    this.isRegistrationOpen,
    this.isWaitlistEnabled,
    this.incompleteTeamsAllowed,
    this.isAutoResultAllowed,
    this.teamSize,
    this.status,
    this.isLevelsEnabled,
    this.indexPage,
    this.dynamicAppUrl,
    this.minLevelId,
    this.gameFormat,
    this.details,
    this.gameIconUrl,
    this.regStartDate,
    this.winnersCount,
    this.coverUrl,
    this.bracketsUrl,
    this.tournamentSlug,
    this.discordUrl,
    this.gameId,
    this.resultSubmissionByAdmin,
    this.country,
    this.adminUsername,
    this.gameName,
    this.streamUrl,
  });

  final bool? isCheckInRequired;
  final String? tournamentId;
  final bool? tournamentEnded;
  final String? tournamentEndDate;
  final bool? areRandomTeamsAllowed;
  final int? registeredTeams;
  final String? adminLocale;
  final String? regEndDate;
  final String? startDate;
  final String? rules;
  final int? maxTeams;
  final String? tournamentUrl;
  final String? prizes;
  final MatchStyleType? matchStyleType;
  final dynamic pwaUrl;
  final TournamentType? tournamentType;
  final Geo? geo;
  final dynamic maxLevelId;
  final bool? isPasswordRequired;
  final String? name;
  final MatchStyle? matchStyle;
  final String? registrationUrl;
  final dynamic gamePkg;
  final bool? isRegistrationOpen;
  final bool? isWaitlistEnabled;
  final bool? incompleteTeamsAllowed;
  final bool? isAutoResultAllowed;
  final int? teamSize;
  final Status? status;
  final bool? isLevelsEnabled;
  final bool? indexPage;
  final String? dynamicAppUrl;
  final dynamic minLevelId;
  final String? gameFormat;
  final String? details;
  final String? gameIconUrl;
  final String? regStartDate;
  final int? winnersCount;
  final String? coverUrl;
  final dynamic bracketsUrl;
  final String? tournamentSlug;
  final String? discordUrl;
  final String? gameId;
  final bool? resultSubmissionByAdmin;
  final Country? country;
  final AdminUsername? adminUsername;
  final String? gameName;
  final String? streamUrl;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        isCheckInRequired: json["is_check_in_required"],
        tournamentId: json["tournament_id"],
        tournamentEnded: json["tournament_ended"],
        tournamentEndDate: json["tournament_end_date"],
        areRandomTeamsAllowed: json["are_random_teams_allowed"],
        registeredTeams: json["registered_teams"],
        adminLocale: json["admin_locale"],
        regEndDate: json["reg_end_date"],
        startDate: json["start_date"],
        rules: json["rules"],
        maxTeams: json["max_teams"],
        tournamentUrl: json["tournament_url"],
        prizes: json["prizes"],
        matchStyleType: json["match_style_type"] == null
            ? null
            : matchStyleTypeValues.map[json["match_style_type"]],
        pwaUrl: json["pwa_url"],
        tournamentType: json["tournament_type"] == null
            ? null
            : tournamentTypeValues.map[json["tournament_type"]],
        geo: json["geo"] == null ? null : geoValues.map[json["geo"]],
        maxLevelId: json["max_level_id"],
        isPasswordRequired: json["is_password_required"],
        name: json["name"],
        matchStyle: json["match_style"] == null
            ? null
            : matchStyleValues.map[json["match_style"]],
        registrationUrl: json["registration_url"],
        gamePkg: json["game_pkg"],
        isRegistrationOpen: json["is_registration_open"],
        isWaitlistEnabled: json["is_waitlist_enabled"],
        incompleteTeamsAllowed: json["incomplete_teams_allowed"],
        isAutoResultAllowed: json["is_auto_result_allowed"],
        teamSize: json["team_size"],
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
        isLevelsEnabled: json["is_levels_enabled"],
        indexPage: json["index_page"],
        dynamicAppUrl: json["dynamic_app_url"],
        minLevelId: json["min_level_id"],
        gameFormat: json["game_format"],
        details: json["details"],
        gameIconUrl: json["game_icon_url"],
        regStartDate: json["reg_start_date"],
        winnersCount: json["winners_count"],
        coverUrl: json["cover_url"],
        bracketsUrl: json["brackets_url"],
        tournamentSlug: json["tournament_slug"],
        discordUrl: json["discord_url"],
        gameId: json["game_id"],
        resultSubmissionByAdmin: json["result_submission_by_admin"],
        country:
            json["country"] == null ? null : countryValues.map[json["country"]],
        adminUsername: json["admin_username"] == null
            ? null
            : adminUsernameValues.map[json["admin_username"]],
        gameName: json["game_name"],
        streamUrl: json["stream_url"],
      );

  Map<String, dynamic> toJson() => {
        "is_check_in_required": isCheckInRequired,
        "tournament_id": tournamentId,
        "tournament_ended": tournamentEnded,
        "tournament_end_date": tournamentEndDate,
        "are_random_teams_allowed": areRandomTeamsAllowed,
        "registered_teams": registeredTeams,
        "admin_locale": adminLocale,
        "reg_end_date": regEndDate,
        "start_date": startDate,
        "rules": rules,
        "max_teams": maxTeams,
        "tournament_url": tournamentUrl,
        "prizes": prizes,
        "match_style_type": matchStyleType == null
            ? null
            : matchStyleTypeValues.reverse[matchStyleType],
        "pwa_url": pwaUrl,
        "tournament_type": tournamentType == null
            ? null
            : tournamentTypeValues.reverse[tournamentType],
        "geo": geo == null ? null : geoValues.reverse[geo],
        "max_level_id": maxLevelId,
        "is_password_required": isPasswordRequired,
        "name": name,
        "match_style":
            matchStyle == null ? null : matchStyleValues.reverse[matchStyle],
        "registration_url": registrationUrl,
        "game_pkg": gamePkg,
        "is_registration_open": isRegistrationOpen,
        "is_waitlist_enabled": isWaitlistEnabled,
        "incomplete_teams_allowed": incompleteTeamsAllowed,
        "is_auto_result_allowed": isAutoResultAllowed,
        "team_size": teamSize,
        "status": status == null ? null : statusValues.reverse[status],
        "is_levels_enabled": isLevelsEnabled,
        "index_page": indexPage,
        "dynamic_app_url": dynamicAppUrl,
        "min_level_id": minLevelId,
        "game_format": gameFormat,
        "details": details,
        "game_icon_url": gameIconUrl,
        "reg_start_date": regStartDate,
        "winners_count": winnersCount,
        "cover_url": coverUrl,
        "brackets_url": bracketsUrl,
        "tournament_slug": tournamentSlug,
        "discord_url": discordUrl,
        "game_id": gameId,
        "result_submission_by_admin": resultSubmissionByAdmin,
        "country": country == null ? null : countryValues.reverse[country],
        "admin_username": adminUsername == null
            ? null
            : adminUsernameValues.reverse[adminUsername],
        "game_name": gameName,
        "stream_url": streamUrl,
      };
}

enum AdminUsername { RANLIX, THE_DUCK, EMPTY }

final adminUsernameValues = EnumValues({
  "ʙᴀᴋᴀ": AdminUsername.EMPTY,
  "Ranlix": AdminUsername.RANLIX,
  "THE_DUCK": AdminUsername.THE_DUCK
});

enum Country { RUSSIA, SWITZERLAND, FRANCE }

final countryValues = EnumValues({
  "France": Country.FRANCE,
  "Russia": Country.RUSSIA,
  "Switzerland": Country.SWITZERLAND
});

enum Geo { RU, CH, FR }

final geoValues = EnumValues({"ch": Geo.CH, "fr": Geo.FR, "ru": Geo.RU});

enum MatchStyle { BRACKETS, LOBBY }

final matchStyleValues =
    EnumValues({"brackets": MatchStyle.BRACKETS, "lobby": MatchStyle.LOBBY});

enum MatchStyleType { SINGLE_ELIMINATION, MULTIPLE_LOBBIES, SINGLE_LOBBY }

final matchStyleTypeValues = EnumValues({
  "multiple_lobbies": MatchStyleType.MULTIPLE_LOBBIES,
  "single_elimination": MatchStyleType.SINGLE_ELIMINATION,
  "single_lobby": MatchStyleType.SINGLE_LOBBY
});

enum Status { PUBLISHED }

final statusValues = EnumValues({"published": Status.PUBLISHED});

enum TournamentType { DISCORD }

final tournamentTypeValues = EnumValues({"discord": TournamentType.DISCORD});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap ?? {};
  }
}
