import 'package:student_movie_app/data/models/lgoin_model.dart';
import 'package:student_movie_app/data/vos/cardInfo_vo.dart';
import 'package:student_movie_app/data/vos/userInfo_vo.dart';
import 'package:student_movie_app/network/dataagents/movie_data_agent.dart';
import 'package:student_movie_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:student_movie_app/network/responses/get_profile_response.dart';
import 'package:student_movie_app/network/responses/logout_response.dart';
import 'package:student_movie_app/network/responses/post_login_response.dart';
import 'package:student_movie_app/persistence/daos/login_dao.dart';

class LoginModelImpl extends LoginModel {
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  LoginDao mLoginDao = new LoginDao();

  static final LoginModelImpl _singleton = LoginModelImpl._internal();

  factory LoginModelImpl() {
    return _singleton;
  }

  LoginModelImpl._internal();

  //Network
  // RegisterWithEmail
  @override
  Future<PostLoginResponse> postRegisterWithEmail(
      String name, String email, String phone, String password,
      {String googleAccessToken, String facebookAccessToken}) {
    return mDataAgent
        .postRegisterWithEmail(name, email, phone, password,
            googleAccessToken: googleAccessToken,
            facebookAccessToken: facebookAccessToken)
        .then((registerData) async {
      mLoginDao.saveUserInfo(registerData.data);
      mLoginDao.saveToken(registerData.token);
      return Future.value(registerData);
    });
  }

  // LoginWithEmail
  @override
  Future<PostLoginResponse> postLoginWithEmail(String email, String password) {
    return mDataAgent
        .postLoginWithEmail(email, password)
        .then((loginData) async {
      mLoginDao.saveUserInfo(loginData.data);
      mLoginDao.saveToken(loginData.token);

      return Future.value(loginData);
    });
  }

  // Logout
  @override
  Future<LogoutResponse> logout() {
    String token;
    token = getToken();
    return mDataAgent.logout(token).then((value) async {
      mLoginDao.deleteToken();

      return Future.value(value);
    });
  }

  // GetProfile
  @override
  Future<GetProfileResponse> getProfile() {
    String token;
    token = getToken();
    return mDataAgent.getProfile(token);
  }

  // Create Card
  @override
  Future<List<CardInfoVo>> postCreateCard(String cardNumber,
      String cardHolder, String expireDate, int cvc) {
    String token;
    token = getToken();
    return Future.value(mDataAgent.postCreateCard(
        token, cardNumber, cardHolder, expireDate, cvc));
  }

  // Database
  // Get Token
  @override
  String getToken() {
    return mLoginDao.getToken();
  }

  // GetUserLogin
  @override
  bool isUserLogin() {
    bool isToken = false;
    isToken = getToken() != null;

    return isToken;
  }
}
