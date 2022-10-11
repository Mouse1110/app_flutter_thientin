import 'package:dio/dio.dart';

import '../constants/api_constant.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> postApprove({
    required String accessToken,
    required String idCampaign,
    required String idUser,
  }) async {
    try {
      final Response response = await _dio.post('${baseUrl}action/approve',
          data: {"campaignId": idCampaign, "userId": idUser},
          options: Options(
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Accept": "application/json",
              "Authorization": "Bearer $accessToken",
            },
          ));
      return response;
    } on DioError catch (e) {
      print(e.response!.data);
      throw Exception(e.response!.data["message"]);
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }

  Future<Response?> postDisbur({
    required String accessToken,
    required String idCampaign,
  }) async {
    try {
      final Response response = await _dio.post('${baseUrl}caimpain/disbur',
          data: {"campaignId": idCampaign},
          options: Options(
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Accept": "application/json",
              "Authorization": "Bearer $accessToken",
            },
          ));
      return response;
    } on DioError catch (e) {
      print(e.response!.data);
      throw Exception(e.response!.data["message"]);
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }

  Future<Response?> getListForm({
    required String accessToken,
    required int id,
  }) async {
    try {
      final Response response = await _dio.get('${baseUrl}action/approve/$id',
          options: Options(
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Accept": "application/json",
              "Authorization": "Bearer $accessToken",
            },
          ));
      return response;
    } on DioError catch (e) {
      print(e.response!.data);
      throw Exception(e.response!.data["message"]);
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }

  Future<Response?> getListFormExist({
    required String accessToken,
    required int id,
  }) async {
    try {
      final Response response =
          await _dio.get('${baseUrl}action/approve/exists/$id',
              options: Options(
                headers: {
                  "Content-Type": "application/x-www-form-urlencoded",
                  "Accept": "application/json",
                  "Authorization": "Bearer $accessToken",
                },
              ));
      return response;
    } on DioError catch (e) {
      print(e.response!.data);
      throw Exception(e.response!.data["message"]);
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }
}
