class User {
  final String fName;
  final String lName;
  final String gender;
  final String city;
  final String country;
  final String email;
  final String number;
  final String picture;

  User({
    required this.fName,
    required this.lName,
    required this.gender,
    required this.city,
    required this.country,
    required this.email,
    required this.number,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fName: json['results'][0]['name']['first'],
      lName: json['results'][0]['name']['last'],
      gender: json['results'][0]['gender'],
      city: json['results'][0]['location']['city'],
      country: json['results'][0]['location']['country'],
      email: json['results'][0]['email'],
      number: json['results'][0]['phone'],
      picture: json['results'][0]['picture']['large'],
    );
  }
}
