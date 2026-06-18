class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final double popularity;
  final int voteCount;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
    required this.popularity,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      overview: json['overview'] ?? 'No overview available.',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
      'release_date': releaseDate,
      'genre_ids': genreIds,
      'popularity': popularity,
      'vote_count': voteCount,
    };
  }

  String get posterUrl => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500$posterPath'
      : 'https://images.unsplash.com/photo-1594909122845-11baa439b7bf?q=80&w=500&auto=format&fit=crop';

  String get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w780$backdropPath'
      : 'https://images.unsplash.com/photo-1594909122845-11baa439b7bf?q=80&w=780&auto=format&fit=crop';

  String get formattedRating => voteAverage.toStringAsFixed(1);

  String get formattedReleaseDate {
    if (releaseDate.isEmpty) return 'TBA';
    try {
      final parts = releaseDate.split('-');
      if (parts.length == 3) {
        final year = parts[0];
        final monthNum = parts[1];
        final day = parts[2];
        final months = [
          'Januari',
          'Februari',
          'Maret',
          'April',
          'Mei',
          'Juni',
          'Juli',
          'Agustus',
          'September',
          'Oktober',
          'November',
          'Desember'
        ];
        final monthIdx = int.tryParse(monthNum);
        if (monthIdx != null && monthIdx >= 1 && monthIdx <= 12) {
          return '$day ${months[monthIdx - 1]} $year';
        }
      }
      return releaseDate;
    } catch (_) {
      return releaseDate;
    }
  }

  String get releaseYear {
    if (releaseDate.isEmpty) return 'TBA';
    return releaseDate.split('-')[0];
  }

  static final Map<int, String> _genreMap = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Sci-Fi',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western',
  };

  List<String> get genres {
    if (genreIds.isEmpty) return ['Movie'];
    final list = genreIds
        .map((id) => _genreMap[id])
        .where((name) => name != null)
        .cast<String>()
        .toList();
    return list.isEmpty ? ['Movie'] : list;
  }
}
