import 'dart:convert';
import 'package:flutter_auth_pkg/src/core/constants/server_constant.dart';
import 'package:flutter_auth_pkg/src/core/failure/failure.dart';
import 'package:flutter_auth_pkg/src/core/models/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository();
}

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      /// FIXME : Used Mock API Data ------- START ---------
      await Future.delayed(const Duration(seconds: 2));
      final response = signUpResponseMock;

      /// FIXME : Used Mock API Data ------- END ---------
      ///
      // final response = await http.post(
      //   Uri.parse(
      //     '${ServerConstant.serverURL}/auth/signup',
      //   ),
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: jsonEncode(
      //     {
      //       'name': name,
      //       'email': email,
      //       'password': password,
      //     },
      //   ),
      // );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201) {
        // {'detail': 'error message'}
        return Left(AppFailure(resBodyMap['error']));
      }

      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      /// FIXME : Used Mock API Data ------- START ---------
      await Future.delayed(const Duration(seconds: 2));
      final response = signInResponseMock;

      /// FIXME : Used Mock API Data ------- END ---------
      ///
      // final response = await http.post(
      //   Uri.parse(
      //     '${ServerConstant.serverURL}/auth/login',
      //   ),
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: jsonEncode(
      //     {
      //       'email': email,
      //       'password': password,
      //     },
      //   ),
      // );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['error']));
      }

      return Right(
        UserModel.fromMap(resBodyMap['user']).copyWith(
          token: resBodyMap['token'],
        ),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> getCurrentUserData(String token) async {
    try {
      /// FIXME : Used Mock API Data ------- START ---------
      await Future.delayed(const Duration(seconds: 2));
      final response = getCurrentUserResponseMock;

      /// FIXME : Used Mock API Data ------- END ---------
      ///
      // final response = await http.get(
      //   Uri.parse(
      //     '${ServerConstant.serverURL}/auth/',
      //   ),
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'x-auth-token': token,
      //   },
      // );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['error']));
      }

      return Right(
        UserModel.fromMap(resBodyMap['user']).copyWith(
          token: resBodyMap['token'],
        ),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}

/// MOCK Data

var tokenMock = "test-token";
var userModelMapMock = {
  "id": 'user-id-1',
  "name": "John Doe",
  "email": "johndeo@gmail.com",
  "password": "test-password",
  "token": tokenMock,
};

var userResponseBodyMock = jsonEncode({
  "token": tokenMock,
  "user": userModelMapMock,
});

/// ---------- Mock Responses ------------

var signUpResponseMock = http.Response(
  userResponseBodyMock,
  201,
);

var signInResponseMock = http.Response(
  userResponseBodyMock,
  200,
);

var getCurrentUserResponseMock = http.Response(
  userResponseBodyMock,
  200,
);

/// ---------- Errors ------------
var userSignupErrorResponseMock = http.Response(
  jsonEncode({"error": "unauthorized"}),
  401,
);

var userLoginErrorResponseMock = http.Response(
  jsonEncode({"error": "unauthorized"}),
  401,
);

var getCurrentUserDataErrorResponseMock = http.Response(
  jsonEncode({"error": "unauthorized"}),
  401,
);
