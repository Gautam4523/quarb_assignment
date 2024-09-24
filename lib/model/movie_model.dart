class MovieModel {
  // final double? score;
  final Show? show;

  MovieModel({
    // this.score,
    this.show,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : /* score = json['score'] as double?,*/
        show = (json['show'] as Map<String, dynamic>?) != null
            ? Show.fromJson(json['show'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {/*'score': score, */ 'show': show?.toJson()};

  static List<MovieModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieModel.fromJson(json)).toList();
  }
}

class Show {
  // final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  // final int? runtime;
  // final int? averageRuntime;
  final String? premiered;
  final dynamic ended;
  final String? officialSite;
  final Schedule? schedule;

  // final int? weight;
  final Network? network;
  final dynamic webChannel;
  final dynamic dvdCountry;
  final Externals? externals;
  final Image? image;
  final String? summary;
  // final int? updated;
  final Links? links;

  Show({
    // this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    // this.runtime,
    // this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,

    // this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    // this.updated,
    this.links,
  });

  Show.fromJson(Map<String, dynamic> json)
      : /*id = json['id'] as int?,*/
        url = json['url'] as String?,
        name = json['name'] as String?,
        type = json['type'] as String?,
        language = json['language'] as String?,
        genres =
            (json['genres'] as List?)?.map((dynamic e) => e as String).toList(),
        status = json['status'] as String?,
        // runtime = json['runtime'] as int?,
        // averageRuntime = json['averageRuntime'] as int?,
        premiered = json['premiered'] as String?,
        ended = json['ended'],
        officialSite = json['officialSite'] as String?,
        schedule = (json['schedule'] as Map<String, dynamic>?) != null
            ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
            : null,

        // weight = json['weight'] as int?,
        network = (json['network'] as Map<String, dynamic>?) != null
            ? Network.fromJson(json['network'] as Map<String, dynamic>)
            : null,
        webChannel = json['webChannel'],
        dvdCountry = json['dvdCountry'],
        externals = (json['externals'] as Map<String, dynamic>?) != null
            ? Externals.fromJson(json['externals'] as Map<String, dynamic>)
            : null,
        image = (json['image'] as Map<String, dynamic>?) != null
            ? Image.fromJson(json['image'] as Map<String, dynamic>)
            : null,
        summary = json['summary'] as String?,
        // updated = json['updated'] as int?,
        links = (json['_links'] as Map<String, dynamic>?) != null
            ? Links.fromJson(json['_links'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'url': url,
        'name': name,
        'type': type,
        'language': language,
        'genres': genres,
        'status': status,
        // 'runtime': runtime,
        // 'averageRuntime': averageRuntime,
        'premiered': premiered,
        'ended': ended,
        'officialSite': officialSite,
        'schedule': schedule?.toJson(),

        // 'weight': weight,
        'network': network?.toJson(),
        'webChannel': webChannel,
        'dvdCountry': dvdCountry,
        'externals': externals?.toJson(),
        'image': image?.toJson(),
        'summary': summary,
        // 'updated': updated,
        '_links': links?.toJson()
      };
}

class Schedule {
  final String? time;
  final List<String>? days;

  Schedule({
    this.time,
    this.days,
  });

  Schedule.fromJson(Map<String, dynamic> json)
      : time = json['time'] as String?,
        days =
            (json['days'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {'time': time, 'days': days};
}

class Network {
  // final int? id;
  final String? name;
  final Country? country;
  final String? officialSite;

  Network({
    // this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  Network.fromJson(Map<String, dynamic> json)
      : /*id = json['id'] as int?,*/
        name = json['name'] as String?,
        country = (json['country'] as Map<String, dynamic>?) != null
            ? Country.fromJson(json['country'] as Map<String, dynamic>)
            : null,
        officialSite = json['officialSite'] as String?;

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'name': name,
        'country': country?.toJson(),
        'officialSite': officialSite
      };
}

class Country {
  final String? name;
  final String? code;
  final String? timezone;

  Country({
    this.name,
    this.code,
    this.timezone,
  });

  Country.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        code = json['code'] as String?,
        timezone = json['timezone'] as String?;

  Map<String, dynamic> toJson() =>
      {'name': name, 'code': code, 'timezone': timezone};
}

class Externals {
  final dynamic tvrage;
  // final int? thetvdb;
  final String? imdb;

  Externals({
    this.tvrage,
    // this.thetvdb,
    this.imdb,
  });

  Externals.fromJson(Map<String, dynamic> json)
      : tvrage = json['tvrage'],
        // thetvdb = json['thetvdb'] as int?,
        imdb = json['imdb'] as String?;

  Map<String, dynamic> toJson() =>
      {'tvrage': tvrage, /*'thetvdb': thetvdb,*/ 'imdb': imdb};
}

class Image {
  final String? medium;
  final String? original;

  Image({
    this.medium,
    this.original,
  });

  Image.fromJson(Map<String, dynamic> json)
      : medium = json['medium'] as String?,
        original = json['original'] as String?;

  Map<String, dynamic> toJson() => {'medium': medium, 'original': original};
}

class Links {
  final Self? self;
  final Previousepisode? previousepisode;

  Links({
    this.self,
    this.previousepisode,
  });

  Links.fromJson(Map<String, dynamic> json)
      : self = (json['self'] as Map<String, dynamic>?) != null
            ? Self.fromJson(json['self'] as Map<String, dynamic>)
            : null,
        previousepisode =
            (json['previousepisode'] as Map<String, dynamic>?) != null
                ? Previousepisode.fromJson(
                    json['previousepisode'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() =>
      {'self': self?.toJson(), 'previousepisode': previousepisode?.toJson()};
}

class Self {
  final String? href;

  Self({
    this.href,
  });

  Self.fromJson(Map<String, dynamic> json) : href = json['href'] as String?;

  Map<String, dynamic> toJson() => {'href': href};
}

class Previousepisode {
  final String? href;
  final String? name;

  Previousepisode({
    this.href,
    this.name,
  });

  Previousepisode.fromJson(Map<String, dynamic> json)
      : href = json['href'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'href': href, 'name': name};
}
