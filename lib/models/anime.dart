import 'dart:convert';

Anime animeFromJson(String str) => Anime.fromJson(json.decode(str));

String animeToJson(Anime data) => json.encode(data.toJson());

class Anime {
  Anime({
    this.statusCode,
    this.message,
    this.data,
    this.version,
  });

  int? statusCode;
  String? message;
  Data? data;
  String? version;

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data!.toJson(),
        "version": version,
      };
}

class Data {
  Data({
    this.currentPage,
    this.count,
    this.documents,
    this.lastPage,
  });

  int? currentPage;
  int? count;
  List<Document>? documents;
  int? lastPage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        count: json["count"],
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "count": count,
        "documents": List<dynamic>.from(documents!.map((x) => x.toJson())),
        "last_page": lastPage,
      };
}

class Document {
  Document({
    this.anilistId,
    this.malId,
    this.tmdbId,
    this.format,
    this.status,
    this.titles,
    this.descriptions,
    this.startDate,
    this.endDate,
    this.seasonPeriod,
    this.seasonYear,
    this.episodesCount,
    this.episodeDuration,
    this.trailerUrl,
    this.coverImage,
    this.coverColor,
    this.bannerImage,
    this.genres,
    this.score,
    this.nsfw,
    this.hasCoverImage,
    this.id,
    this.prequel,
    this.weeklyAiringDay,
    this.sagas,
    this.sequel,
  });

  int? anilistId;
  int? malId;
  int? tmdbId;
  int? format;
  int? status;
  Descriptions? titles;
  Descriptions? descriptions;
  DateTime? startDate;
  DateTime? endDate;
  int? seasonPeriod;
  int? seasonYear;
  int? episodesCount;
  int? episodeDuration;
  String? trailerUrl;
  String? coverImage;
  String? coverColor;
  String? bannerImage;
  List<String>? genres;
  int? score;
  bool? nsfw;
  bool? hasCoverImage;
  int? id;
  int? prequel;
  int? weeklyAiringDay;
  List<Sagas>? sagas;
  int? sequel;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        anilistId: json["anilist_id"],
        malId: json["mal_id"],
        tmdbId: json["tmdb_id"] == null ? null : json["tmdb_id"],
        format: json["format"],
        status: json["status"],
        titles: Descriptions.fromJson(json["titles"]),
        descriptions: Descriptions.fromJson(json["descriptions"]),
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        seasonPeriod: json["season_period"],
        seasonYear: json["season_year"] == null ? null : json["season_year"],
        episodesCount: json["episodes_count"],
        episodeDuration: json["episode_duration"],
        trailerUrl: json["trailer_url"] == null ? null : json["trailer_url"],
        coverImage: json["cover_image"],
        coverColor: json["cover_color"] == null ? null : json["cover_color"],
        bannerImage: json["banner_image"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        score: json["score"],
        nsfw: json["nsfw"],
        hasCoverImage: json["hasCoverImage"],
        id: json["id"],
        prequel: json["prequel"] == null ? null : json["prequel"],
        weeklyAiringDay: json["weekly_airing_day"] == null
            ? null
            : json["weekly_airing_day"],
        sagas: json["sagas"] == null
            ? null
            : List<Sagas>.from(json["sagas"].map((x) => Sagas.fromJson(x))),
        sequel: json["sequel"] == null ? null : json["sequel"],
      );

  Map<String, dynamic> toJson() => {
        "anilist_id": anilistId,
        "mal_id": malId,
        "tmdb_id": tmdbId == null ? null : tmdbId,
        "format": format,
        "status": status,
        "titles": titles!.toJson(),
        "descriptions": descriptions!.toJson(),
        "start_date": startDate!.toIso8601String(),
        "end_date": endDate!.toIso8601String(),
        "season_period": seasonPeriod,
        "season_year": seasonYear == null ? null : seasonYear,
        "episodes_count": episodesCount,
        "episode_duration": episodeDuration,
        "trailer_url": trailerUrl == null ? null : trailerUrl,
        "cover_image": coverImage,
        "cover_color": coverColor == null ? null : coverColor,
        "banner_image": bannerImage,
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "score": score,
        "nsfw": nsfw,
        "hasCoverImage": hasCoverImage,
        "id": id,
        "prequel": prequel == null ? null : prequel,
        "weekly_airing_day": weeklyAiringDay == null ? null : weeklyAiringDay,
        "sagas": sagas == null
            ? null
            : List<dynamic>.from(sagas!.map((x) => x.toJson())),
        "sequel": sequel == null ? null : sequel,
      };
}

class Descriptions {
  Descriptions({
    this.en,
    this.fr,
    this.jp,
    this.it,
    this.rj,
  });

  String? en;
  String? fr;
  String? jp;
  String? it;
  String? rj;

  factory Descriptions.fromJson(Map<String, dynamic> json) => Descriptions(
        en: json["en"] == null ? null : json["en"],
        fr: json["fr"] == null ? null : json["fr"],
        jp: json["jp"] == null ? null : json["jp"],
        it: json["it"] == null ? null : json["it"],
        rj: json["rj"] == null ? null : json["rj"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
        "fr": fr == null ? null : fr,
        "jp": jp == null ? null : jp,
        "it": it == null ? null : it,
        "rj": rj == null ? null : rj,
      };
}

class Sagas {
  Sagas({
    this.titles,
    this.descriptions,
    this.episodeFrom,
    this.episodeTo,
    this.episodesCount,
  });

  Descriptions? titles;
  Descriptions? descriptions;
  int? episodeFrom;
  int? episodeTo;
  int? episodesCount;

  factory Sagas.fromJson(Map<String, dynamic> json) => Sagas(
        titles: Descriptions.fromJson(json["titles"]),
        descriptions: Descriptions.fromJson(json["descriptions"]),
        episodeFrom: json["episode_from"],
        episodeTo: json["episode_to"],
        episodesCount: json["episodes_count"],
      );

  Map<String, dynamic> toJson() => {
        "titles": titles!.toJson(),
        "descriptions": descriptions!.toJson(),
        "episode_from": episodeFrom,
        "episode_to": episodeTo,
        "episodes_count": episodesCount,
      };
}
