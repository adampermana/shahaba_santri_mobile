import 'package:json_annotation/json_annotation.dart';

part 'ai_chat_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AiChatResponse {
  AiChatResponse({
    this.answer,
    this.model,
    this.tokensUsed,
    this.executionTimeMs,
  });

  factory AiChatResponse.fromJson(Map<String, dynamic> json) =>
      _$AiChatResponseFromJson(json);

  String? answer;
  String? model;
  int? tokensUsed;
  int? executionTimeMs;

  Map<String, dynamic> toJson() => _$AiChatResponseToJson(this);
}
