// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LF _$LFFromJson(Map<String, dynamic> json) => LF(
      lf: json['lf'] as String,
      freq: json['freq'] as num,
      since: json['since'] as int,
      vars: (json['vars'] as List<dynamic>?)
              ?.map((e) => LF.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LFToJson(LF instance) => <String, dynamic>{
      'lf': instance.lf,
      'freq': instance.freq,
      'since': instance.since,
      'vars': instance.vars,
    };
