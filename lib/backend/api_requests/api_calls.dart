import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UploadImageToDomainCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? pickedImage,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UploadImageToDomain',
      apiUrl: 'https://laserfze.com/api/upload.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'pickedImage': pickedImage,
        'file': pickedImage,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imageurl(dynamic response) => getJsonField(
        response,
        r'''$.latest_file.url''',
      );
}

class GetLatestImageCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetLatestImage',
      apiUrl: 'https://laserfze.com/api/GET-return last image.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class GetLocationNameCall {
  static Future<ApiCallResponse> call({
    String? apigeo = '25.471,55.891',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get location name',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyD3EPsDHrrz1WKLc8Lidcfr6v0ZGr9M3BA",
        'latlng': apigeo,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? apicity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?(@.types[0]=='administrative_area_level_1')].long_name
''',
      ));
  static String? apiarea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[1].long_name
''',
      ));
}

class DistanceCall {
  static Future<ApiCallResponse> call({
    String? start = '25.271463659764354,55.31047009436351',
    String? end = '25.323922486844747,55.38274338343068',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Distance',
      apiUrl: 'https://maps.googleapis.com/maps/api/distancematrix/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'origins': start,
        'destinations': end,
        'key': "AIzaSyD3EPsDHrrz1WKLc8Lidcfr6v0ZGr9M3BA",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
      ));
  static List<String>? origin(dynamic response) => (getJsonField(
        response,
        r'''$.origin_addresses''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? destination(dynamic response) => (getJsonField(
        response,
        r'''$.destination_addresses''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
