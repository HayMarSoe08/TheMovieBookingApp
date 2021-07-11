import 'package:student_movie_app/data/vos/checkout_vo.dart';
import 'package:student_movie_app/data/vos/cinema_vo.dart';
import 'package:student_movie_app/data/vos/movie_seat_vo.dart';
import 'package:student_movie_app/data/vos/movie_vo.dart';
import 'package:student_movie_app/data/vos/snack_vo.dart';
import 'package:student_movie_app/network/request/checkout_request.dart';
import 'package:student_movie_app/network/responses/post_checkout_response.dart';

abstract class MovieModel {
  // Network
  Future<List<MovieVo>> getMovieList(String status);

  Future<MovieVo> getMovieDetails(int movieId);

  // Database
  Future<List<MovieVo>> getNowPlayingMovieListFromDatabase();

  Future<List<MovieVo>> getComingSoonMovieListFromDatabase();

  Future<MovieVo> getMovieDetailsFromDatabase(int movieId);

  Future<List<CinemaVo>> getCinemaDayTimeslot(String date);

  Future<List<List<MovieSeatVO>>> getMovieSeatingPlan(
      int cinemaDayTimeslotId, String bookingDate);

  Future<List<SnackVo>> getSnackList();

  Future<CheckOutVo> getUserTransaction();

  Future<CheckOutVo> postCheckOut(
      int cinemaDayTimeSlotId,
      String seatNumber,
      String bookingDate,
      int movieId,
      int cardId,
      List<SnackVo> snackList);
}
