part of 'i_ai_chat_remote_datasource.dart';

class AiChatRemoteDatasource implements IAiChatRemoteDatasource {
  AiChatRemoteDatasource(this._dio);

  final Dio _dio;

  @override
  Future<AiChatResponse> postAiChat({required String message}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/ai/chat',
        data: {
          'history': [
            {'content': message, 'role': 'user'},
          ],
          'question': message,
          'stream': false,
          'tags': ['SAH'],
          'top_k': 5,
        },
      );

      final data = response.data;
      if (data == null) {
        throw ServerException.withMessage(
          title: 'Error',
          message: 'Gagal memuat jawaban AI',
        );
      }

      return AiChatResponse.fromJson(data);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }
}
