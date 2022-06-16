class PersonDetailsModel {
  PersonDetailsModel({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  DateTime? birthday;
  dynamic deathday;
  int? gender;
  dynamic homepage;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;

  factory PersonDetailsModel.fromJson(Map<String, dynamic> json) => PersonDetailsModel(
    adult: json["adult"]!= null ? json["adult"] : null,
    alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
    biography: json["biography"] != null ? json["biography"] : null,
    birthday: json["birthday"] != null ? DateTime.parse(json["birthday"]) : null,
    deathday: json["deathday"] != null ? json["deathday"] : null,
    gender: json["gender"] != null ? json["gender"] : null,
    homepage: json["homepage"]!= null ? json["homepage"] : null,
    id: json["id"]!= null ? json["id"] : null,
    imdbId: json["imdb_id"]!= null ? json["imdb_id"] : null,
    knownForDepartment: json["known_for_department"]!= null ? json["known_for_department"] : null,
    name: json["name"]!= null ? json["name"] : null,
    placeOfBirth: json["place_of_birth"]!= null ? json["place_of_birth"] : null,
    popularity: json["popularity"].toDouble()!= null ? json["popularity"].toDouble() : null,
    profilePath: json["profile_path"]!= null ? json["profile_path"] : null,
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "also_known_as": List<dynamic>.from(alsoKnownAs!.map((x) => x)),
    "biography": biography,
    "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "deathday": deathday,
    "gender": gender,
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "known_for_department": knownForDepartment,
    "name": name,
    "place_of_birth": placeOfBirth,
    "popularity": popularity,
    "profile_path": profilePath,
  };
}
