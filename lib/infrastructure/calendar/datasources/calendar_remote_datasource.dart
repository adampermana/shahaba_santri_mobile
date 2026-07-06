import 'package:dio/dio.dart';
import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/i_calendar_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

class CalendarRemoteDatasource implements ICalendarRemoteDatasource {
  CalendarRemoteDatasource(this._dio);

  final Dio _dio;

  @override
  Future<List<IslamicHolidayModel>> getHolidays(int year) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api',
        queryParameters: {'year': year},
      );

      final data = response.data;
      if (data == null || data['status'] != 'success' || data['code'] != 200) {
        throw ServerException.withMessage(
          title: 'Error',
          message: 'Gagal memuat data hari besar Islam',
        );
      }

      final holidays = data['data'] as List<dynamic>;
      return holidays
          .map(
            (e) => IslamicHolidayModel.fromHariLiburJson(
              e as Map<String, dynamic>,
            ),
          )
          .where((holiday) => holiday.isIslamicEvent)
          .toList();
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }
}
