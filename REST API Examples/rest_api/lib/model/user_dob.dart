class UserDob{
  late final DateTime date;
  late final int age;

  UserDob({required this.age, required this.date});

  factory UserDob.fromMap(Map<String, dynamic> e){
     final date = e['dob']['date'];
     return UserDob(
        age: e['dob']['age'],
        date: DateTime.parse(date));
  }
}