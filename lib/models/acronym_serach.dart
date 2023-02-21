import 'dart:convert';

import 'package:acronyms_finder/models/lf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'acronym_serach.g.dart';

@JsonSerializable()
class AcronymSearch {
  final String sf;

  @JsonKey(defaultValue: <LF>[])
  final List<LF> lfs;

  AcronymSearch({required this.sf, required this.lfs});

  factory AcronymSearch.fromJson(Map<String, dynamic> json) =>
      _$AcronymSearchFromJson(json);

  Map<String, dynamic> toJson() => _$AcronymSearchToJson(this);
}

List<AcronymSearch> parseSearchResults(String jsonStr) {
  Iterable l = json.decode(jsonStr);
  return List<AcronymSearch>.from(
      l.map((model) => AcronymSearch.fromJson(model)));
}
