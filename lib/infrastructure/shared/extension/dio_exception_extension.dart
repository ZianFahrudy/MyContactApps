// ignore_for_file: lines_longer_than_80_chars

import 'package:dio/dio.dart';
import 'package:my_contact_app/infrastructure/error/failures.dart';

extension DioExceptionExtension on DioException {
  Failure exceptionFormater(int code) {
    switch (code) {
      case 400:
        return ServerFailure.fromJson(response!.data as Map<String, dynamic>);
      case 401:
        return const ServerFailure(
          'Sesi Kadaluwarsa',
        );
      case 403:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 404:
        return ServerFailure.fromJson(response!.data as Map<String, dynamic>);
      case 405:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 408:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 422:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 500:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 501:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 502:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 503:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 504:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 505:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 506:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 507:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 508:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 509:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 510:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      case 511:
        return ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi. Kode error: ${response!.statusCode}',
        );
      default:
        return const ServerFailure(
          'Terjadi kesalahan mohon coba kembali dalam beberapa saat lagi',
        );
    }
  }
}
