// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortofolioModel _$PortofolioModelFromJson(Map<String, dynamic> json) =>
    _PortofolioModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      marketCapRank: (json['marketCapRank'] as num).toInt(),
    );

Map<String, dynamic> _$PortofolioModelToJson(_PortofolioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'marketCapRank': instance.marketCapRank,
    };
