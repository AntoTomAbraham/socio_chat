class nft {
  List<OwnedNfts>? ownedNfts;
  int? totalCount;
  String? blockHash;

  nft({this.ownedNfts, this.totalCount, this.blockHash});

  nft.fromJson(Map<String, dynamic> json) {
    if (json['ownedNfts'] != null) {
      ownedNfts = <OwnedNfts>[];
      json['ownedNfts'].forEach((v) {
        ownedNfts!.add(new OwnedNfts.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    blockHash = json['blockHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ownedNfts != null) {
      data['ownedNfts'] = this.ownedNfts!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    data['blockHash'] = this.blockHash;
    return data;
  }
}

class OwnedNfts {
  Contract? contract;
  Id? id;
  String? balance;
  String? title;
  String? description;
  TokenUri? tokenUri;
  List<Media>? media;
  Metadata? metadata;
  String? timeLastUpdated;

  OwnedNfts(
      {this.contract,
      this.id,
      this.balance,
      this.title,
      this.description,
      this.tokenUri,
      this.media,
      this.metadata,
      this.timeLastUpdated});

  OwnedNfts.fromJson(Map<String, dynamic> json) {
    contract = json['contract'] != null
        ? new Contract.fromJson(json['contract'])
        : null;
    id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    balance = json['balance'];
    title = json['title'];
    description = json['description'];
    tokenUri = json['tokenUri'] != null
        ? new TokenUri.fromJson(json['tokenUri'])
        : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    timeLastUpdated = json['timeLastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contract != null) {
      data['contract'] = this.contract!.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id!.toJson();
    }
    data['balance'] = this.balance;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.tokenUri != null) {
      data['tokenUri'] = this.tokenUri!.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['timeLastUpdated'] = this.timeLastUpdated;
    return data;
  }
}

class Media {
  Media.fromJson(v);

  toJson() {}
}

class Contract {
  String? address;

  Contract({this.address});

  Contract.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    return data;
  }
}

class Id {
  String? tokenId;
  TokenMetadata? tokenMetadata;

  Id({this.tokenId, this.tokenMetadata});

  Id.fromJson(Map<String, dynamic> json) {
    tokenId = json['tokenId'];
    tokenMetadata = json['tokenMetadata'] != null
        ? new TokenMetadata.fromJson(json['tokenMetadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tokenId'] = this.tokenId;
    if (this.tokenMetadata != null) {
      data['tokenMetadata'] = this.tokenMetadata!.toJson();
    }
    return data;
  }
}

class TokenMetadata {
  String? tokenType;

  TokenMetadata({this.tokenType});

  TokenMetadata.fromJson(Map<String, dynamic> json) {
    tokenType = json['tokenType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tokenType'] = this.tokenType;
    return data;
  }
}

class TokenUri {
  String? raw;
  String? gateway;

  TokenUri({this.raw, this.gateway});

  TokenUri.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    gateway = json['gateway'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['gateway'] = this.gateway;
    return data;
  }
}

class Metadata {
  String? name;
  String? description;
  String? image;
  String? externalUrl;
  List<Attributes>? attributes;

  Metadata(
      {this.name,
      this.description,
      this.image,
      this.externalUrl,
      this.attributes});

  Metadata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    externalUrl = json['external_url'];
    // if (json['attributes'] != null) {
    //   attributes = <Attributes>[];
    //   json['attributes'].forEach((v) {
    //     attributes!.add(new Attributes.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['external_url'] = this.externalUrl;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String? value;
  String? traitType;

  Attributes({this.value, this.traitType});

  Attributes.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    traitType = json['trait_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['trait_type'] = this.traitType;
    return data;
  }
}
