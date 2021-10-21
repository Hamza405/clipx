class Movies {
  int? id;
  String? categoryId;
  String? title;
  String? previewText;
  String? description;
  Team? team;
  Image? image;
  String? itemType;
  String? status;
  String? single;
  String? trending;
  String? featured;
  String? version;
  String? tags;
  String? ratings;
  String? view;
  String? createdAt;
  String? updatedAt;

  Movies(
      {this.id,
      this.categoryId,
      this.title,
      this.previewText,
      this.description,
      this.team,
      this.image,
      this.itemType,
      this.status,
      this.single,
      this.trending,
      this.featured,
      this.version,
      this.tags,
      this.ratings,
      this.view,
      this.createdAt,
      this.updatedAt});

  Movies.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    previewText = json['preview_text'];
    description = json['description'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    itemType = json['item_type'];
    status = json['status'];
    single = json['single'];
    trending = json['trending'];
    featured = json['featured'];
    version = json['version'];
    tags = json['tags'];
    ratings = json['ratings'];
    view = json['view'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['preview_text'] = this.previewText;
    data['description'] = this.description;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['item_type'] = this.itemType;
    data['status'] = this.status;
    data['single'] = this.single;
    data['trending'] = this.trending;
    data['featured'] = this.featured;
    data['version'] = this.version;
    data['tags'] = this.tags;
    data['ratings'] = this.ratings;
    data['view'] = this.view;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Team {
  String? director;
  String? producer;
  String? casts;

  Team({this.director, this.producer, this.casts});

  Team.fromJson(Map<String?, dynamic> json) {
    director = json['director'];
    producer = json['producer'];
    casts = json['casts'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['director'] = this.director;
    data['producer'] = this.producer;
    data['casts'] = this.casts;
    return data;
  }
}

class Image {
  String? landscape;
  String? portrait;

  Image({this.landscape, this.portrait});

  Image.fromJson(Map<String?, dynamic> json) {
    landscape = json['landscape'];
    portrait = json['portrait'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['landscape'] = this.landscape;
    data['portrait'] = this.portrait;
    return data;
  }
}
