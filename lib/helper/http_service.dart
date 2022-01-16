import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/ForgetPassResponse.dart';
import 'package:qatra_app/models/HomeResponse.dart';
import 'package:qatra_app/models/Order.dart';
import 'package:qatra_app/models/OrderResponse.dart';
import 'package:qatra_app/models/PaymentResponse.dart';
import 'package:qatra_app/models/ProductsResponse.dart';
import 'package:qatra_app/models/ProfileResponse.dart';
import 'package:qatra_app/models/ResetModel.dart';
import 'package:qatra_app/models/SearchResponse.dart';
import 'package:qatra_app/models/SettingResponse.dart';
import 'package:qatra_app/models/User.dart';
import 'package:qatra_app/models/loginjson.dart';
import 'package:qatra_app/models/productDitailsResponse.dart';
import 'package:qatra_app/screens/forget_password/forget_pass.dart';
import 'package:qatra_app/screens/login/loginbyphone_screen.dart';
import 'package:qatra_app/screens/newuser/new_user.dart';
import 'package:uni_links/uni_links.dart';

class HttpService {
  Dio _dio;

  // final baseUrl = "http://qatra.pal-dev.com/api/";
  final baseUrl = "https://portal.qatrahksa.com/api/";

  static HttpService apiHelper = HttpService();

  HttpService() {
    _dio = Dio();

    // initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        print(e.message);
      },
      onRequest: (options, handler) {
        print("${options.method} ${options.path}");
      },
      onResponse: (e, handler) {
        print(e.data);
      },
    ));
  }

  Future<Loginjson> login(String userName, String password, loginType) async {
    try {
      Response response = await _dio.post(baseUrl + 'user/auth/login',
          data: {'email': userName, 'password': password, 'login': loginType},
          options: Options(
            headers: {'Accept': 'application/json'},
            validateStatus: (status) {
              print("fffffff $status");
              return status < 500;
            },
          ));

      print(response.data);
      Loginjson registerResponse = Loginjson.fromJson(response.data);
      return registerResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<Loginjson> login1(String userName, String password, loginType) async {
    try {
      Response response = await _dio.post(baseUrl + 'user/auth/login',
          data: {'phone': userName, 'password': password, 'login': loginType},
          options: Options(
              headers: {'Accept': 'application/json'},
              validateStatus: (status) {
                print("fffffff $status");
                return status < 500;
              }));

      print(response.data);
      Loginjson registerResponse = Loginjson.fromJson(response.data);
      return registerResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<Loginjson> newUser(
      String email, String phone, String password, String country) async {
    try {
      Response response = await _dio.post(baseUrl + 'user/auth/register',
          data: {
            'email': email,
            'phone': phone,
            'password': password,
            'country': country
          },
          options: Options(
              headers: {'Accept': 'application/json'},
              validateStatus: (status) {
                print("fffffffs $status");
                return status < 500;
              }));

      print(response.data);
      Loginjson registerResponse = Loginjson.fromJson(response.data);
      return registerResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<ForgetPassResponse> forgetPassword(String email) async {
    try {
      Response response = await _dio.post(baseUrl + 'user/auth/forget-password',
          data: {
            'email': email,
          },
          options: Options(
              headers: {'Accept': 'application/json'},
              validateStatus: (status) {
                print("fffffff $status");
                return status < 500;
              }));

      print(response.data);
      ForgetPassResponse registerResponse =
          ForgetPassResponse.fromJson(response.data);
      return registerResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<ForgetPassResponse> SMSCodeVerification(
      String phone, String sms_verification) async {
    try {
      Response response =
          await _dio.post(baseUrl + 'user/auth/send-sms-verification-code',
              data: {'phone': phone, 'sms_verification': sms_verification},
              options: Options(
                  headers: {'Accept': 'application/json'},
                  validateStatus: (status) {
                    print("fffffff $status");
                    return status < 500;
                  }));

      print(response.data);
      ForgetPassResponse registerResponse =
          ForgetPassResponse.fromJson(response.data);
      return registerResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<ForgetPassResponse> resetPassword(ResetModel model) async {
    try {
      Response response = await _dio.post(baseUrl + 'user/auth/reset-password',
          data: model.toJson(),
          options: Options(
              headers: {'Accept': 'application/json'},
              validateStatus: (status) {
                print("fffffff $status");
                return status < 500;
              }));

      print(response.data);
      ForgetPassResponse registerResponse =
          ForgetPassResponse.fromJson(response.data);
      return registerResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<HomeResponse> getMosque(context) async {
    print("gggggg " + SharedPrefrencesHelper.sharedPrefrencesHelper.getToken());
    try {
      Response response = await _dio.get(baseUrl + 'user/home',
          options: Options(
              headers: {
                'Authorization':
                    'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                'Accept': 'application/json'
              },
              validateStatus: (status) {
                print("fffffff $status");
                if (status != 200) {
                  SharedPrefrencesHelper.sharedPrefrencesHelper.clear();
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(builder: (context) => Login()),
                    (_) => false,
                  );
                }
                return status < 500;
              }));

      print(response.data);
      HomeResponse homeResponse = HomeResponse.fromJson(response.data);
      return homeResponse;
    } on DioError catch (e) {
      print("ffffffff ${e.message}");
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<products> getProducts() async {
    try {
      Response response = await _dio.get(baseUrl + 'user/products',
          options: Options(
              headers: {
                'Authorization':
                    'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                'Accept': 'application/json'
              },
              validateStatus: (status) {
                print("fffffff $status");
                return status < 500;
              }));

      print(response.data);
      products productsResponse = products.fromJson(response.data);
      return productsResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<productDitails> getProductDetails(productId, mosqueId) async {
    try {
      Response response =
          await Dio().get(baseUrl + 'user/product/$productId/$mosqueId',
              options: Options(
                  headers: {
                    'Authorization':
                        'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                    'Accept': 'application/json'
                  },
                  validateStatus: (status) {
                    print("fffffff $status");
                    return status < 500;
                  }));

      print(response.data);
      productDitails productsResponse = productDitails.fromJson(response.data);
      return productsResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<SettingResponse> getSetting() async {
    try {
      Response response = await Dio().get(baseUrl + 'user/settings',
          options: Options(
              headers: {
                'Authorization':
                    'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                'Accept': 'application/json'
              },
              validateStatus: (status) {
                print("fffffff $status");
                return status < 500;
              }),
          queryParameters: {
            "key": SharedPrefrencesHelper.sharedPrefrencesHelper.getType(),
          });

      print(response.data);
      SettingResponse settingResponse = SettingResponse.fromJson(response.data);
      return settingResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<OrderResponse> getMyOrders() async {
    try {
      Response response = await Dio().get(baseUrl + 'user/orders',
          options: Options(
              headers: {
                'Authorization':
                    'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                'Accept': 'application/json'
              },
              validateStatus: (status) {
                print("fffffff $status");
                return status < 500;
              }));

      print(response.data);
      OrderResponse orderResponse = OrderResponse.fromJson(response.data);
      return orderResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<ProfileResponse> getMyProfile() async {
    try {
      Response response = await Dio().get(baseUrl + 'user/auth/me',
          options: Options(
              headers: {
                'Authorization':
                    'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                'Accept': 'application/json'
              },
              validateStatus: (status) {
                print("fffffff $status");
                return status < 500;
              }));

      print(response.data);
      ProfileResponse orderResponse = ProfileResponse.fromJson(response.data);
      return orderResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<Loginjson> updateProfile(User user) async {
    print(user.password);
    try {
      Response response = await _dio.post(baseUrl + 'user/auth/profile',
          data: user.toJson(),
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {
                'Authorization':
                    'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                'Accept': 'application/json'
              }));

      // Response response = await _dio.post(baseUrl + 'user/auth/profile',
      //     data: user.toJson(),
      //     options: Options(headers: {
      //       'Authorization':
      //           'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
      //       'Accept': 'application/json'
      //     },validateStatus: (status) {
      //       print("fffffff $status");
      //       return status < 500;
      //     }));

      print(response.data);
      Loginjson registerResponse = Loginjson.fromJson(response.data);
      return registerResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<PaymentResponse> sendOrder(Order order) async {
    print((order.receiverName.isEmpty || order.receiverName.isEmpty));
    try {
      Response response = await Dio().post(baseUrl + 'user/send-order',
          data: (order.receiverName.isEmpty || order.receiverName.isEmpty)
              ? order.toJsonWithout()
              : order.toJson(),
          options: Options(
              headers: {
                'Authorization':
                    'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                'Accept': 'application/json'
              },
              validateStatus: (status) {
                print("fffffff $status");
                return status < 500;
              }));
      print(response.data);
      PaymentResponse paymentResponse = PaymentResponse.fromJson(response.data);
      return paymentResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialUri = await getInitialUri();
      print('initial uri: ${initialUri?.path}'
          ' ${initialUri?.queryParameters["email"]}'
          ' ${initialUri?.pathSegments.last}');

      final initialLink = initialUri?.toString();

      // final initialLink = await getInitialLink();
      print("ffffffffffff $initialLink");

      if (initialLink != null) {
        SharedPrefrencesHelper.sharedPrefrencesHelper
            .setData("resetToken", initialUri?.pathSegments.last);
        SharedPrefrencesHelper.sharedPrefrencesHelper
            .setData("email", initialUri?.queryParameters["email"]);
        Get.offAll(() => ForgetPassword(), transition: Transition.leftToRight);
      }

      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  Future<SearchResponse> getMosqueSearch(name, source, {nextPageToken}) async {
    try {
      Response response = await _dio.get(baseUrl + 'user/search-mosque',
          queryParameters: {
            "nextPageToken": nextPageToken,
            "name": name,
            "source": source,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
              'Accept': 'application/json'
            },
            validateStatus: (status) {
              print("fffffff $status");
              return status < 500;
            },
          ));

      print(response.data);
      SearchResponse orderResponse = SearchResponse.fromJson(response.data);
      return orderResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }
}
