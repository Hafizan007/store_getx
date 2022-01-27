import 'package:dio/dio.dart';

// ignore: constant_identifier_names
enum Method { POST, GET, PUT, DELETE, PATCH }

const String baseUrl = 'https://rickandmortyapi.com/api';

class HttpService {
  Dio? _dio;

  header() => {"Content-Type": "application/json"};

  Future<HttpService> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: header(),
      responseType: ResponseType.json,
      connectTimeout: 3000,
      receiveTimeout: 3000,
    ));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) {
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio!.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        if (e.response!.statusCode == 404) {
          return "404";
        } else if (e.response!.statusCode == 401) {
          return "Unauthorized";
        } else if (e.response!.statusCode == 500) {
          return "Server Error";
        } else {
          return "Something does wen't wrong";
        }
      }
      if (e.type == DioErrorType.connectTimeout) {
        return e.message;
      }
      if (e.type == DioErrorType.other) {
        return "Something does wen't wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
