import 'package:json_annotation/json_annotation.dart';

part 'lf.g.dart';

@JsonSerializable()
class LF {
  final String lf;

  final num freq;

  final int since; 

  @JsonKey(defaultValue: <LF>[],)
  List<LF> vars;


  LF({required this.lf, required this.freq,required this.since,required this.vars});

  factory LF.fromJson(Map<String, dynamic> json) => _$LFFromJson(json);

  Map<String, dynamic> toJson() => _$LFToJson(this);
}