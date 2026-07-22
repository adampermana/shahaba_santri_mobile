part of 'i_ai_chat_repository.dart';

class AiChatRepository implements IAiChatRepository {
  AiChatRepository(this._remoteDatasource);

  final IAiChatRemoteDatasource _remoteDatasource;

  @override
  Future<Either<ServerFailures, AiChatResponse>> postAiChat(
    String message,
  ) async {
    try {
      final response = await _remoteDatasource.postAiChat(message: message);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }
}
