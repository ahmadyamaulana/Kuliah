import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'movie_service.dart';
import 'widget/movie_card.dart';
import 'widget/search.dart';
import 'widget/loading_skeleton.dart';


class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final MovieService _movieService = MovieService();

  List<MovieModel> _movies = [];
  bool _isLoading = true;
  String? _errorMessage;

  // Kategori film aktif
  String _activeCategory = 'popular';

  // Status Pencarian
  bool _isSearching = false;
  String _searchQuery = '';

  // Tab kategori dalam Bahasa Indonesia untuk user
  final List<Map<String, String>> _categories = [
    {'id': 'popular', 'label': 'Populer'},
    {'id': 'now_playing', 'label': 'Sedang Tayang'},
    {'id': 'top_rated', 'label': 'Terbaik'},
    {'id': 'upcoming', 'label': 'Mendatang'},
  ];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  // Memanggil API berdasarkan kategori aktif atau pencarian
  Future<void> _loadMovies() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      List<MovieModel> loadedMovies;
      if (_isSearching && _searchQuery.isNotEmpty) {
        loadedMovies = await _movieService.searchMovies(_searchQuery);
      } else {
        loadedMovies =
            await _movieService.fetchMovies(category: _activeCategory);
      }

      setState(() {
        _movies = loadedMovies;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  void _onCategoryChanged(String categoryId) {
    if (_activeCategory == categoryId && !_isSearching) return;
    setState(() {
      _activeCategory = categoryId;
      _isSearching = false;
      _searchQuery = '';
    });
    _loadMovies();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _isSearching = query.isNotEmpty;
    });
    // Menjalankan pencarian (kita juga bisa debounce di sini, namun load langsung sangat responsif)
    _loadMovies();
  }

  void _onSearchCleared() {
    setState(() {
      _isSearching = false;
      _searchQuery = '';
    });
    _loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Deep Slate Black background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: const Row(
          children: [
            Text(
              'Mada Movie',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 24,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _loadMovies,
        color: Colors.amber,
        backgroundColor: const Color(0xFF1E293B),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            // 1. Header Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: CustomSearchBar(
                  onChanged: _onSearchChanged,
                  onClear: _onSearchCleared,
                ),
              ),
            ),

            // 2. Category Selector (Hanya muncul jika tidak sedang mencari)
            if (!_isSearching)
              SliverToBoxAdapter(
                child: Container(
                  height: 55,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    physics: const BouncingScrollPhysics(),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final cat = _categories[index];
                      final isActive = _activeCategory == cat['id'];
                      return GestureDetector(
                        onTap: () => _onCategoryChanged(cat['id']!),
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: isActive
                                ? Colors.amber
                                : const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: Colors.amber.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    )
                                  ]
                                : null,
                          ),
                          child: Text(
                            cat['label']!,
                            style: TextStyle(
                              color: isActive
                                  ? const Color(0xFF0F172A)
                                  : Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            // 3. Grid Views & States (Loading, Error, Empty, Loaded)
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              sliver: _buildMainContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    // A. Sedang loading
    if (_isLoading) {
      return const SliverToBoxAdapter(
        child: LoadingSkeleton(itemCount: 6),
      );
    }

    // B. Terjadi error
    if (_errorMessage != null) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wifi_off_rounded,
                color: Colors.white24,
                size: 80,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  _errorMessage!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _loadMovies,
                icon:
                    const Icon(Icons.refresh_rounded, color: Color(0xFF0F172A)),
                label: const Text('Coba Lagi'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: const Color(0xFF0F172A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // C. Data kosong
    if (_movies.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.movie_filter_rounded,
                color: Colors.white24,
                size: 80,
              ),
              const SizedBox(height: 16),
              Text(
                _isSearching
                    ? 'Film tidak ditemukan.'
                    : 'Tidak ada film tersedia.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // D. Data berhasil dimuat
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MovieCard(movie: _movies[index]);
        },
        childCount: _movies.length,
      ),
    );
  }
}
