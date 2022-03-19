class game {
  List<Games>? games;
  String? publisherName;

  game({this.games, this.publisherName});

  game.fromJson(Map<String, dynamic> json) {
    if (json['games'] != null) {
      games = <Games>[];
      json['games'].forEach((v) {
        games!.add(new Games.fromJson(v));
      });
    }
    publisherName = json['publisherName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.games != null) {
      data['games'] = this.games!.map((v) => v.toJson()).toList();
    }
    data['publisherName'] = this.publisherName;
    return data;
  }
}

class Games {
  String? code;
  String? url;
  Name? name;
  bool? isPortrait;
  Name? description;
  Name? gamePreviews;
  Assets? assets;
  Categories? categories;
  Categories? tags;
  int? width;
  int? height;
  String? colorMuted;
  String? colorVibrant;
  bool? privateAllowed;
  dynamic? rating;
  int? numberOfRatings;
  int? gamePlays;

  Games(
      {this.code,
      this.url,
      this.name,
      this.isPortrait,
      this.description,
      this.gamePreviews,
      this.assets,
      this.categories,
      this.tags,
      this.width,
      this.height,
      this.colorMuted,
      this.colorVibrant,
      this.privateAllowed,
      this.rating,
      this.numberOfRatings,
      this.gamePlays});

  Games.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    url = json['url'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    isPortrait = json['isPortrait'];
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    gamePreviews = json['gamePreviews'] != null
        ? new Name.fromJson(json['gamePreviews'])
        : null;
    assets =
        json['assets'] != null ? new Assets.fromJson(json['assets']) : null;
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    tags = json['tags'] != null ? new Categories.fromJson(json['tags']) : null;
    width = json['width'];
    height = json['height'];
    colorMuted = json['colorMuted'];
    colorVibrant = json['colorVibrant'];
    privateAllowed = json['privateAllowed'];
    rating = json['rating'];
    numberOfRatings = json['numberOfRatings'];
    gamePlays = json['gamePlays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['url'] = this.url;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['isPortrait'] = this.isPortrait;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.gamePreviews != null) {
      data['gamePreviews'] = this.gamePreviews!.toJson();
    }
    if (this.assets != null) {
      data['assets'] = this.assets!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.toJson();
    }
    data['width'] = this.width;
    data['height'] = this.height;
    data['colorMuted'] = this.colorMuted;
    data['colorVibrant'] = this.colorVibrant;
    data['privateAllowed'] = this.privateAllowed;
    data['rating'] = this.rating;
    data['numberOfRatings'] = this.numberOfRatings;
    data['gamePlays'] = this.gamePlays;
    return data;
  }
}

class Name {
  String? en;

  Name({this.en});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}

class Assets {
  String? cover;
  String? brick;
  String? thumb;
  String? wall;
  String? square;
  List<String>? screens;
  String? coverTiny;
  String? brickTiny;

  Assets(
      {this.cover,
      this.brick,
      this.thumb,
      this.wall,
      this.square,
      this.screens,
      this.coverTiny,
      this.brickTiny});

  Assets.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    brick = json['brick'];
    thumb = json['thumb'];
    wall = json['wall'];
    square = json['square'];
    screens = json['screens'].cast<String>();
    coverTiny = json['coverTiny'];
    brickTiny = json['brickTiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['brick'] = this.brick;
    data['thumb'] = this.thumb;
    data['wall'] = this.wall;
    data['square'] = this.square;
    data['screens'] = this.screens;
    data['coverTiny'] = this.coverTiny;
    data['brickTiny'] = this.brickTiny;
    return data;
  }
}

class Categories {
  List<String>? en;

  Categories({this.en});

  Categories.fromJson(Map<String, dynamic> json) {
    en = json['en'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}
