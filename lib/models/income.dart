import 'package:json_annotation/json_annotation.dart';

part 'income.g.dart';

@JsonSerializable()
class Income {
  Income();

  String? id;
  @JsonKey(defaultValue: 0) num total = 0;
  
  factory Income.fromJson(Map<String,dynamic> json) => _$IncomeFromJson(json);
  Map<String, dynamic> toJson() => _$IncomeToJson(this);
}
