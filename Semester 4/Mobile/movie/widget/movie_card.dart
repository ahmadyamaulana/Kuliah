import 'package:flutter/material.dart';
import '../movie_model.dart';
import '../movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(movie: movie),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                // Poster Image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Hero(
                      tag: 'movie-poster-${movie.id}',
                      child: Image.network(
                        movie.posterUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: const Color(0xFF1E293B),
                            child: const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.amber),
                                ),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF1E293B),
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported_rounded,
                                color: Colors.white24,
                                size: 40,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Rating Badge (Gold Star capsule)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.amber.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber, // Gold Star
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.formattedRating,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Title
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),

          // Year & Genre summary
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movie.releaseYear,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
              Flexible(
                child: Text(
                  movie.genres.first,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.amber.withOpacity(0.9),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
