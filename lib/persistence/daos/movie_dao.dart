import 'package:hive/hive.dart';
import 'package:student_movie_app/data/vos/movie_vo.dart';

import '../hive_constants.dart';

class MovieDao {
  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  MovieDao._internal();

  void saveMovieAll(List<MovieVo> movieList) async{
    Map<int, MovieVo> movieMap = Map.fromIterable(movieList,
    key: (movie) => movie.id, value: (movie) => movie);
    await getMovieBox().putAll(movieMap);
  }

  void saveSingleMovie(MovieVo movie) async {
    await getMovieBox().put(movie.id, movie);
  }

  List<MovieVo> getAllMovies() {
    return getMovieBox().values.toList();
  }

  MovieVo getMovieById(int movieId) {
    return getMovieBox().get(movieId);
  }

  Box<MovieVo> getMovieBox() {
    return Hive.box<MovieVo>(BOX_NAME_MOVIE_VO);
  }
}
