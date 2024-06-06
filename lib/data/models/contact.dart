// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  @JsonKey(name: '_id')
  String id;
  String firstName;
  String lastName;
  String nickName;
  String dateOfBirth;
  String gender;

  String phone;
  String email;
  String address;

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.nickName,
    required this.dateOfBirth,
    required this.gender,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
