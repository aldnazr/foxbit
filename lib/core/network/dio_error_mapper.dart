import 'package:dio/dio.dart';
import 'package:foxbit/core/error/app_failure.dart';

AppFailure mapDioError(Object error) {
  if (error is AppFailure) return error;
  if (error is DioException) {
    final status = error.response?.statusCode;
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return const AppFailure('Koneksi timeout, coba lagi sebentar');
    }
    if (error.type == DioExceptionType.connectionError) {
      return const AppFailure('Tidak ada koneksi internet');
    }
    if (status == 429) {
      return const AppFailure('Terlalu banyak permintaan, coba lagi sebentar');
    }
    final data = error.response?.data;
    if (data is Map && data['message'] != null) {
      return AppFailure(data['message'].toString(), statusCode: status);
    }
    return AppFailure(
      'Terjadi kesalahan (${status ?? 'network'})',
      statusCode: status,
    );
  }
  return AppFailure(error.toString());
}
