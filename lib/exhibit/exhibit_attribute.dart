import 'package:freezed_annotation/freezed_annotation.dart';

part 'exhibit_attribute.freezed.dart';
part 'exhibit_attribute.g.dart';

@freezed
abstract class ExhibitAttribute with _$ExhibitAttribute {
  const factory ExhibitAttribute({required String id, required String name}) =
      _ExhibitAttribute;

  factory ExhibitAttribute.fromJson(Map<String, dynamic> json) =>
      _$ExhibitAttributeFromJson(json);
}
