import 'package:json_annotation/json_annotation.dart';

part 'islamic_holiday_model.g.dart';

@JsonSerializable()
class IslamicHolidayModel {
  IslamicHolidayModel({
    required this.date,
    required this.day,
    required this.name,
    required this.type,
  });

  factory IslamicHolidayModel.fromJson(Map<String, dynamic> json) =>
      _$IslamicHolidayModelFromJson(json);

  factory IslamicHolidayModel.fromHariLiburJson(Map<String, dynamic> json) {
    return IslamicHolidayModel(
      date: json['date'] as String,
      day: '',
      name: json['description'] as String,
      type: 'holiday',
    );
  }

  final String date;
  final String day;
  final String name;
  final String type;

  Map<String, dynamic> toJson() => _$IslamicHolidayModelToJson(this);

  bool get isHoliday => type == 'holiday';
  bool get isLeave => type == 'leave';
  bool get isIslamicEvent {
    final lowerName = name.toLowerCase();
    return _islamicEventKeywords.any(lowerName.contains);
  }

  int get year => int.parse(date.split('-')[0]);
  int get month => int.parse(date.split('-')[1]);
  int get dayOfMonth => int.parse(date.split('-')[2]);

  static const _islamicEventKeywords = <String>[
    'islam',
    'hijri',
    'hijriah',
    'hijriyah',
    'idul',
    'fitri',
    'adha',
    'isra',
    'mikraj',
    "mi'raj",
    'maulid',
    'nabi muhammad',
    'ramadhan',
    'ramadan',
    'lebaran',
  ];
}
