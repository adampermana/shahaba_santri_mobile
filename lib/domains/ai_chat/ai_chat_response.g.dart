// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatResponse _$AiChatResponseFromJson(Map<String, dynamic> json) =>
    AiChatResponse(
      answer: json['answer'] as String?,
      model: json['model'] as String?,
      tokensUsed: (json['tokens_used'] as num?)?.toInt(),
      executionTimeMs: (json['execution_time_ms'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AiChatResponseToJson(AiChatResponse instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'model': instance.model,
      'tokens_used': instance.tokensUsed,
      'execution_time_ms': instance.executionTimeMs,
    };
