import 'package:rest_api/model/user_dob.dart';
import 'package:rest_api/model/user_location.dart';
import 'package:rest_api/model/user_name.dart';
import 'package:rest_api/model/user_picture.dart';

class User{
  late final String gender;
  late final String email;
  late final String phone;
  late final String cell;
  late final String nat;
  late final UserName name;
  late final UserDob dob;
  late final UserLocation location;
  late final UserPicture picture;

  User({required this.email, required this.cell, required this.gender, required this.nat, required this.phone, required this.name, required this.dob, required this.location, required this.picture});


  factory User.formMap(Map<String, dynamic> e){

    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final picture = UserPicture.fromMap(e['picture']);
    final location = UserLocation.fromMap(e['location']);
    return User(
      email: e['email'] ?? '',
      cell: e['cell'] ?? '',
      gender: e['gender'] ?? '',
      nat: e['nat'] ?? '',
      phone: e['phone'] ?? '',
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
}
}

