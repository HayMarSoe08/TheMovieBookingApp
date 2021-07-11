import 'package:student_movie_app/data/models/lgoin_model.dart';
import 'package:student_movie_app/data/models/login_model_impl.dart';
import 'package:student_movie_app/data/models/movie_model.dart';
import 'package:student_movie_app/data/vos/checkout_vo.dart';
import 'package:student_movie_app/data/vos/cinema_vo.dart';
import 'package:student_movie_app/data/vos/movie_seat_vo.dart';
import 'package:student_movie_app/data/vos/movie_vo.dart';
import 'package:student_movie_app/data/vos/snack_vo.dart';
import 'package:student_movie_app/network/dataagents/movie_data_agent.dart';
import 'package:student_movie_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:student_movie_app/network/request/checkout_request.dart';
import 'package:student_movie_app/network/request/snack_request.dart';
import 'package:student_movie_app/network/responses/post_checkout_response.dart';
import 'package:student_movie_app/persistence/daos/movie_dao.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();
  MovieDao mMovieDao = new MovieDao();
  LoginModel mLoginModel = new LoginModelImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  MovieModelImpl._internal();

  // Network
  // Get Movie List
  @override
  Future<List<MovieVo>> getMovieList(String status) {
    return mDataAgent.getMovieList(status).then((movies) {
      List<MovieVo> isNowPlayingMovies = movies.map((movies) {
        status == "nowPlaying"
            ? movies.isNowPlaying = true
            : movies.isComingsoon = true;
        return movies;
      }).toList();
      mMovieDao.saveMovieAll(isNowPlayingMovies);
      return Future.value(movies);
    });
  }

  // Get Movie Details
  @override
  Future<MovieVo> getMovieDetails(int movieId) {
    Future<MovieVo> movie = mDataAgent.getMovieDetails(movieId);
    movie.then((value) => mMovieDao.saveSingleMovie(value));
    return Future.value(movie);
  }

  // Get Cinema Day Timeslots
  @override
  Future<List<CinemaVo>> getCinemaDayTimeslot(String date) {
    String token;
    token = mLoginModel.getToken();
    return Future.value(mDataAgent.getCinemaDayTimeslot(token, date));
  }

  // Get Movie Seating Plan
  @override
  Future<List<List<MovieSeatVO>>> getMovieSeatingPlan(
      int cinemaDayTimeslotId, String bookingDate) {
    String token;
    token = mLoginModel.getToken();
    return Future.value(mDataAgent.getMovieSeatingPlan(
        token, cinemaDayTimeslotId, bookingDate));
  }

  // Get Snack List
  @override
  Future<List<SnackVo>> getSnackList() {
    String token;
    token = mLoginModel.getToken();
    return Future.value(mDataAgent.getSnackList(token));
  }

  // User Transaction
  @override
  Future<CheckOutVo> getUserTransaction() {
    String token;
    token = mLoginModel.getToken();
    return Future.value(mDataAgent.getUserTransaction(token));
  }

  // CheckOut
  @override
  Future<CheckOutVo> postCheckOut(
      int cinemaDayTimeSlotId,
      String seatNumber,
      String bookingDate,
      int movieId,
      int cardId,
      List<SnackVo> snackList) {

    CheckOutRequest checkOutRequest = new CheckOutRequest(
        cinemaDayTimeSlotId,
        seatNumber,
        bookingDate,
        movieId,
        cardId,
        snackList
            .map((snack) => new SnackRequest(snack.id, snack.quantity))
            .toList());
    String token;
    token = mLoginModel.getToken();

    return Future.value(mDataAgent.postCheckOut(token, checkOutRequest));

  }

  // Database
  // Now Playing
  @override
  Future<List<MovieVo>> getNowPlayingMovieListFromDatabase() {
    return Future.value(mMovieDao
        .getAllMovies()
        .where((movie) => movie.isNowPlaying ?? true)
        .toList());
  }

  // Coming Soon
  @override
  Future<List<MovieVo>> getComingSoonMovieListFromDatabase() {
    return Future.value(mMovieDao
        .getAllMovies()
        .where((movie) => movie.isComingsoon ?? true)
        .toList());
  }

  // Movie Details From Database
  @override
  Future<MovieVo> getMovieDetailsFromDatabase(int movieId) {
    return Future.value(mMovieDao.getMovieById(movieId));
  }
}
