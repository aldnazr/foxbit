import 'package:freezed_annotation/freezed_annotation.dart';

part 'portofolio_model.freezed.dart';
part 'portofolio_model.g.dart';

@freezed
abstract class PortofolioModel with _$PortofolioModel {
  const factory PortofolioModel({
    required String id,
    required String symbol,
    required String name,
    required String image,
    @JsonKey(name: 'marketCapRank') required int marketCapRank,
  }) = _PortofolioModel;

  factory PortofolioModel.fromJson(Map<String, dynamic> json) =>
      _$PortofolioModelFromJson(json);
}
