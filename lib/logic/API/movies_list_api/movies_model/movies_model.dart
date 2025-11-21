class MoviesResponse {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  MoviesResponse({this.status, this.statusMessage, this.data, this.meta});

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? new Meta.fromJson(json['@meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_message'] = this.statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.meta != null) {
      data['@meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movies>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  Data.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(new Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movie_count'] = this.movieCount;
    data['limit'] = this.limit;
    data['page_number'] = this.pageNumber;
    if (this.movies != null) {
      data['movies'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Movies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    // حل مشكلة int vs double
    rating = (json['rating'] != null)
        ? (json['rating'] is int
        ? (json['rating'] as int).toDouble()
        : json['rating'] as double)
        : null;
    runtime = json['runtime'];
    genres = (json['genres'] != null) ? List<String>.from(json['genres']) : null;
    summary = json['summary'] ?? '';
    descriptionFull = json['description_full'] ?? '';
    synopsis = json['synopsis'] ?? '';
    ytTrailerCode = json['yt_trailer_code'] ?? '';
    language = json['language'] ?? '';
    mpaRating = json['mpa_rating'] ?? '';
    backgroundImage = json['background_image'] ?? '';
    backgroundImageOriginal = json['background_image_original'] ?? '';
    smallCoverImage = json['small_cover_image'] ?? '';
    mediumCoverImage = json['medium_cover_image'] ?? '';
    largeCoverImage = json['large_cover_image'] ?? '';
    state = json['state'] ?? '';
    if (json['torrents'] != null) {
      torrents = <Torrents>[];
      json['torrents'].forEach((v) {
        torrents!.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'] ?? '';
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['url'] = url;
    data['imdb_code'] = imdbCode;
    data['title'] = title;
    data['title_english'] = titleEnglish;
    data['title_long'] = titleLong;
    data['slug'] = slug;
    data['year'] = year;
    data['rating'] = rating;
    data['runtime'] = runtime;
    data['genres'] = genres;
    data['summary'] = summary;
    data['description_full'] = descriptionFull;
    data['synopsis'] = synopsis;
    data['yt_trailer_code'] = ytTrailerCode;
    data['language'] = language;
    data['mpa_rating'] = mpaRating;
    data['background_image'] = backgroundImage;
    data['background_image_original'] = backgroundImageOriginal;
    data['small_cover_image'] = smallCoverImage;
    data['medium_cover_image'] = mediumCoverImage;
    data['large_cover_image'] = largeCoverImage;
    data['state'] = state;
    if (torrents != null) {
      data['torrents'] = torrents!.map((v) => v.toJson()).toList();
    }
    data['date_uploaded'] = dateUploaded;
    data['date_uploaded_unix'] = dateUploadedUnix;
    return data;
  }
}


class Torrents {
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Torrents(
      {this.url,
        this.hash,
        this.quality,
        this.type,
        this.isRepack,
        this.videoCodec,
        this.bitDepth,
        this.audioChannels,
        this.seeds,
        this.peers,
        this.size,
        this.sizeBytes,
        this.dateUploaded,
        this.dateUploadedUnix});

  Torrents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['hash'] = this.hash;
    data['quality'] = this.quality;
    data['type'] = this.type;
    data['is_repack'] = this.isRepack;
    data['video_codec'] = this.videoCodec;
    data['bit_depth'] = this.bitDepth;
    data['audio_channels'] = this.audioChannels;
    data['seeds'] = this.seeds;
    data['peers'] = this.peers;
    data['size'] = this.size;
    data['size_bytes'] = this.sizeBytes;
    data['date_uploaded'] = this.dateUploaded;
    data['date_uploaded_unix'] = this.dateUploadedUnix;
    return data;
  }
}

class Meta {
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Meta(
      {this.serverTime,
        this.serverTimezone,
        this.apiVersion,
        this.executionTime});

  Meta.fromJson(Map<String, dynamic> json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['server_time'] = this.serverTime;
    data['server_timezone'] = this.serverTimezone;
    data['api_version'] = this.apiVersion;
    data['execution_time'] = this.executionTime;
    return data;
  }
}