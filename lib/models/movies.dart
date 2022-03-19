class Movies {
  Movies({
    required this.message,
    required this.status,
    required this.results,
  });
  late final String message;
  late final int status;
  late final List<Results> results;

  Movies.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.server,
    required this.title,
    required this.quality,
    required this.size,
    required this.url,
  });
  late final String server;
  late final String title;
  late final String quality;
  late final int size;
  late final String url;

  Results.fromJson(Map<String, dynamic> json) {
    server = json['server'];
    title = json['title'];
    quality = json['quality'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['server'] = server;
    _data['title'] = title;
    _data['quality'] = quality;
    _data['size'] = size;
    _data['url'] = url;
    return _data;
  }
}
