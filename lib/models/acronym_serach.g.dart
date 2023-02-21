// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acronym_serach.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcronymSearch _$AcronymSearchFromJson(Map<String, dynamic> json) =>
    AcronymSearch(
      sf: json['sf'] as String,
      lfs: (json['lfs'] as List<dynamic>?)
              ?.map((e) => LF.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AcronymSearchToJson(AcronymSearch instance) =>
    <String, dynamic>{
      'sf': instance.sf,
      'lfs': instance.lfs,
    };
