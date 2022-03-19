class Topgame {
  List<Data>? data;
  Pagination? pagination;

  Topgame({this.data, this.pagination});

  Topgame.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? streamId;
  String? userId;
  String? userLogin;
  String? userName;
  String? title;
  String? description;
  String? createdAt;
  Null? publishedAt;
  String? url;
  String? thumbnailUrl;
  String? viewable;
  int? viewCount;
  String? language;
  String? type;
  String? duration;
  Null? mutedSegments;

  Data(
      {this.id,
      this.streamId,
      this.userId,
      this.userLogin,
      this.userName,
      this.title,
      this.description,
      this.createdAt,
      this.publishedAt,
      this.url,
      this.thumbnailUrl,
      this.viewable,
      this.viewCount,
      this.language,
      this.type,
      this.duration,
      this.mutedSegments});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    streamId = json['stream_id'];
    userId = json['user_id'];
    userLogin = json['user_login'];
    userName = json['user_name'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    publishedAt = json['published_at'];
    url = json['url'];
    thumbnailUrl = json['thumbnail_url'];
    viewable = json['viewable'];
    viewCount = json['view_count'];
    language = json['language'];
    type = json['type'];
    duration = json['duration'];
    mutedSegments = json['muted_segments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stream_id'] = this.streamId;
    data['user_id'] = this.userId;
    data['user_login'] = this.userLogin;
    data['user_name'] = this.userName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['published_at'] = this.publishedAt;
    data['url'] = this.url;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['viewable'] = this.viewable;
    data['view_count'] = this.viewCount;
    data['language'] = this.language;
    data['type'] = this.type;
    data['duration'] = this.duration;
    data['muted_segments'] = this.mutedSegments;
    return data;
  }
}

class Pagination {
  String? cursor;

  Pagination({this.cursor});

  Pagination.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    return data;
  }
}
