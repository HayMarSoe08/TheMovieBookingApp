import 'package:student_movie_app/data/vos/cardInfo_vo.dart';
import 'package:student_movie_app/data/vos/userInfo_vo.dart';
import 'package:student_movie_app/network/responses/get_profile_response.dart';
import 'package:student_movie_app/network/responses/logout_response.dart';
import 'package:student_movie_app/network/responses/post_login_response.dart';

abstract class LoginModel {
  //Network
  Future<PostLoginResponse> postRegisterWithEmail(
      String name, String email, String phone, String password,
      {String googleAccessToken, String facebookAccessToken});

  Future<PostLoginResponse> postLoginWithEmail(String email, String password);

  Future<LogoutResponse> logout();

  Future<GetProfileResponse> getProfile();

  Future<List<CardInfoVo>> postCreateCard(String cardNumber, String cardHolder, String expireDate, int cvc);

  // Database
  String getToken();
  bool isUserLogin();

}
