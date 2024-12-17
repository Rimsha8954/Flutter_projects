class UserLocation{

   final String city;
   final String state;
   final String country;
   final String postcode;
   final LocationStreet street;
   final LocationCoordinates coordinates;
   final LocationTimeZoneCoordinates timezone;


  UserLocation({required this.street, required this.state, required this.city, required this.coordinates, required this.country, required this.postcode, required this.timezone});


  factory UserLocation.fromMap(Map<String, dynamic> e){
    final street = LocationStreet.fromMap(e['street']);
    final timezone = LocationTimeZoneCoordinates.fromMap(e['timezone']);
    final coordinates = LocationCoordinates.fromMap(e['coordinates']);
    return UserLocation(
      state: e['location']['state'],
      city: e['location']['city'],
      country: e['location']['country'],
      postcode: e['location']['postcode'].toString(),
      coordinates: coordinates,
      timezone: timezone,
      street: street,
    );
  }
}

class LocationCoordinates{
   final String latitude;
   final String longitude;

  LocationCoordinates({required this.latitude, required this.longitude});

   factory LocationCoordinates.fromMap(Map<String, dynamic> e){
     return LocationCoordinates(latitude: e['location']['coordinates']['latitude'], longitude: e['location']['coordinates']['longitude']);
   }
}

class LocationTimeZoneCoordinates{
   final String offset;
   final String description;

  LocationTimeZoneCoordinates({required this.description, required this.offset});

   factory LocationTimeZoneCoordinates.fromMap(Map<String, dynamic> e){
     return LocationTimeZoneCoordinates(
         description: e['location']['timezone']['description'],
         offset: e['location']['timezone']['offset']);
   }
}

class LocationStreet{
   final int number;
   final String name;

  LocationStreet({required this.name, required this.number});

   factory LocationStreet.fromMap(Map<String, dynamic> e){
     return LocationStreet(name: e['location']['street']['name'], number: e['location']['street']['number']);
   }
}