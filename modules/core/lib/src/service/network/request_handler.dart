import 'dart:developer';

import 'package:dio/dio.dart';

import 'error_model.dart';
import 'src/failures.dart';

extension FutureResponseExtension on Future<Response> {
  Future<(ErrorModel?, T?)> guard<T>(Function(dynamic) parse) async {
    try {
      final response = await this;

      return (null, parse(response.data) as T);
    } on Failure catch (e, stacktrace) {
      log(
        runtimeType.toString(),
        error: {},
        stackTrace: stacktrace,
      );

      ErrorModel errorModel = ErrorModel.fromJson(e.error);

      return (errorModel, null);
    }
  }
}
