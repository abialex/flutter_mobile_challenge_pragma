// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_item_list_data_model.freezed.dart';
part 'cat_item_list_data_model.g.dart';

@freezed
class CatItemListDataModel with _$CatItemListDataModel {
  const factory CatItemListDataModel({
    required String id,
    required String name,
    required Weight weight,
    @JsonKey(name: 'cfa_url') String? cfaUrl,
    @JsonKey(name: 'vetstreet_url') String? vetstreetUrl,
    @JsonKey(name: 'vcahospitals_url') String? vcaHospitalsUrl,
    required String temperament,
    required String origin,
    @JsonKey(name: 'country_codes') required String countryCodes,
    @JsonKey(name: 'country_code') required String countryCode,
    required String description,
    @JsonKey(name: 'life_span') required String lifeSpan,
    required int indoor,
    int? lap,
    @JsonKey(name: 'alt_names') String? altNames,
    required int adaptability,
    @JsonKey(name: 'affection_level') required int affectionLevel,
    @JsonKey(name: 'child_friendly') required int childFriendly,
    @JsonKey(name: 'dog_friendly') required int dogFriendly,
    @JsonKey(name: 'energy_level') required int energyLevel,
    required int grooming,
    @JsonKey(name: 'health_issues') required int healthIssues,
    required int intelligence,
    @JsonKey(name: 'shedding_level') required int sheddingLevel,
    @JsonKey(name: 'social_needs') required int socialNeeds,
    @JsonKey(name: 'stranger_friendly') required int strangerFriendly,
    required int vocalisation,
    required int experimental,
    required int hairless,
    required int natural,
    required int rare,
    required int rex,
    @JsonKey(name: 'suppressed_tail') required int suppressedTail,
    @JsonKey(name: 'short_legs') required int shortLegs,
    @JsonKey(name: 'wikipedia_url') String? wikipediaUrl,
    required int hypoallergenic,
    @JsonKey(name: 'reference_image_id') String? referenceImageId,
    ImageData? image,
  }) = _CatItemListDataModel;

  factory CatItemListDataModel.fromJson(Map<String, dynamic> json) => _$CatItemListDataModelFromJson(json);
}

@freezed
class Weight with _$Weight {
  const factory Weight({required String imperial, required String metric}) = _Weight;

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}

@freezed
class ImageData with _$ImageData {
  const factory ImageData({required String id, required int width, required int height, required String url}) =
      _ImageData;

  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);
}
