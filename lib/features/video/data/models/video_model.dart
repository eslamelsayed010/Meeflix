class VideoModel {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  DateTime? publishedAt;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? id;

  VideoModel({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.publishedAt,
    this.site,
    this.size,
    this.type,
    this.official,
    this.id,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        iso6391: json['iso_639_1'] as String?,
        iso31661: json['iso_3166_1'] as String?,
        name: json['name'] as String?,
        key: json['key'] as String?,
        publishedAt: json['published_at'] == null
            ? null
            : DateTime.parse(json['published_at'] as String),
        site: json['site'] as String?,
        size: json['size'] as int?,
        type: json['type'] as String?,
        official: json['official'] as bool?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'iso_639_1': iso6391,
        'iso_3166_1': iso31661,
        'name': name,
        'key': key,
        'published_at': publishedAt?.toIso8601String(),
        'site': site,
        'size': size,
        'type': type,
        'official': official,
        'id': id,
      };
}
