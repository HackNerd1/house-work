import 'package:json_annotation/json_annotation.dart';

part 'houseWork.g.dart';

@JsonSerializable()
class HouseWork {
  HouseWork();

  late String id;
  late String name;
  String? banner;
  String? description;
  late num worth;
  late bool deleted;
  
  factory HouseWork.fromJson(Map<String,dynamic> json) => _$HouseWorkFromJson(json);
  Map<String, dynamic> toJson() => _$HouseWorkToJson(this);
}
