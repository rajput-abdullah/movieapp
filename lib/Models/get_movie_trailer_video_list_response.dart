/// id : 629542
/// results : [{"iso_639_1":"en","iso_3166_1":"US","name":"A Look Inside Featurette","key":"BolPXJLYywA","site":"YouTube","size":1080,"type":"Featurette","official":true,"published_at":"2022-03-16T17:54:31.000Z","id":"623287dd1dbc880074233752"},{"iso_639_1":"en","iso_3166_1":"US","name":"Official Trailer 2","key":"zpDuBXB_glk","site":"YouTube","size":1080,"type":"Trailer","official":true,"published_at":"2022-02-23T16:00:36.000Z","id":"62165e480cd446001cc4427d"},{"iso_639_1":"en","iso_3166_1":"US","name":"Cast Table Read","key":"9mUJ-MCxYGA","site":"YouTube","size":1080,"type":"Behind the Scenes","official":true,"published_at":"2021-12-16T19:14:57.000Z","id":"61c5528e2ac4990041985922"},{"iso_639_1":"en","iso_3166_1":"US","name":"Official Trailer 1","key":"m8Xt0yXaDPU","site":"YouTube","size":1080,"type":"Trailer","official":true,"published_at":"2021-12-14T14:59:52.000Z","id":"61b94f78a44d090095ff6a22"}]

class GetMovieTrailerVideoListResponse {
  GetMovieTrailerVideoListResponse({
      this.id, 
      this.results,});

  GetMovieTrailerVideoListResponse.fromJson(dynamic json) {
    id = json['id'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  int? id;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// iso_639_1 : "en"
/// iso_3166_1 : "US"
/// name : "A Look Inside Featurette"
/// key : "BolPXJLYywA"
/// site : "YouTube"
/// size : 1080
/// type : "Featurette"
/// official : true
/// published_at : "2022-03-16T17:54:31.000Z"
/// id : "623287dd1dbc880074233752"

class Results {
  Results({
      this.iso6391, 
      this.iso31661, 
      this.name, 
      this.key, 
      this.site, 
      this.size, 
      this.type, 
      this.official, 
      this.publishedAt, 
      this.id,});

  Results.fromJson(dynamic json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_639_1'] = iso6391;
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    map['key'] = key;
    map['site'] = site;
    map['size'] = size;
    map['type'] = type;
    map['official'] = official;
    map['published_at'] = publishedAt;
    map['id'] = id;
    return map;
  }

}