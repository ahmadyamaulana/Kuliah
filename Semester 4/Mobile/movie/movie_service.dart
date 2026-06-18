import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_model.dart';

class MovieService {
  // Gunakan String.fromEnvironment untuk keamanan, dengan fallback API key
  static const String _apiKey = String.fromEnvironment(
    'TMDB_API_KEY',
    defaultValue:
        '10d2a8d827ead726c5552875f8c45003', // Silakan ganti dengan API key TMDB Anda jika diperlukan
  );

  static const String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<MovieModel>> fetchMovies({String category = 'popular'}) async {
    // Endpoint TMDB: popular, now_playing, top_rated, upcoming
    final uri = Uri.parse(
      '$_baseUrl/movie/$category'
      '?api_key=$_apiKey'
      '&language=id-ID' // Default ke Bahasa Indonesia agar terasa lokal dan premium
      '&page=1',
    );

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw Exception(
          'Koneksi internet lambat. Periksa koneksi internet kamu.'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'] ?? [];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      throw Exception(
          'API Key TMDB tidak valid atau kadaluarsa. Silakan periksa kembali _apiKey di movie_service.dart.');
    } else if (response.statusCode == 404) {
      throw Exception('Endpoint tidak ditemukan (404).');
    } else {
      throw Exception('Gagal memuat film. Status: ${response.statusCode}');
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    if (query.trim().isEmpty) return [];

    final uri = Uri.parse(
      '$_baseUrl/search/movie'
      '?api_key=$_apiKey'
      '&query=${Uri.encodeComponent(query)}'
      '&language=id-ID'
      '&page=1',
    );

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw Exception(
          'Koneksi internet lambat. Periksa koneksi internet kamu.'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'] ?? [];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      throw Exception(
          'API Key TMDB tidak valid atau kadaluarsa. Silakan periksa kembali _apiKey di movie_service.dart.');
    } else {
      throw Exception(
          'Gagal mencari film. Status kode: ${response.statusCode}');
    }
  }
}
